import boto3
import os
import logging

# Configure logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

sns = boto3.client('sns')
tagging = boto3.client('resourcegroupstaggingapi')

def handler(event, context):
    logger.info("Received event: %s", event)

    detail = event.get('detail', {})
    resource_arn = detail.get('resourceArn')
    region = event.get('region', "UnknownRegion")

    logger.info("Processing backup failure for resource: %s in region: %s", resource_arn, region)

    # Fetch tags for the resource
    try:
        response = tagging.get_resources(ResourceARNList=[resource_arn])
        tags = response['ResourceTagMappingList'][0]['Tags']
        logger.info("Tags retrieved: %s", tags)
    except Exception as e:
        logger.error("Error fetching tags: %s", e)
        raise

    severity = next((t['Value'] for t in tags if t['Key'] == 'severity'), None)
    app_name = next((t['Value'] for t in tags if t['Key'] == 'application'), "UnknownApp")

    logger.info("Severity: %s, Application: %s", severity, app_name)

    if severity == "critical":
        subject_line = f"Critical Backup Failure - {app_name} - {region}"
        message_body = f"Backup job failed for resource {resource_arn} in {region}."

        logger.info("Publishing message to SNS: %s", subject_line)
        sns.publish(
            TopicArn=os.environ['SNS_TOPIC_ARN'],
            Subject=subject_line,
            Message=message_body
        )
    else:
        logger.info("Severity not critical, no notification sent.")
