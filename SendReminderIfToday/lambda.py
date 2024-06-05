import boto3
import datetime

def lambda_handler(event, context):

    # Set the date to send the email
    send_date = datetime.datetime(2024, 6, 31)

    # Get the current date and time
    current_time = datetime.datetime.now()

    # Check if the current date is the same as the send date
    if current_time.date() == send_date.date():

        # Create an SES client
        ses = boto3.client('ses')

        # Set the email parameters
        sender = 'email@domain.com'
        recipient = 'email@domain.com'
        subject = 'Subject of the message - Info'
        body = 'Body of the message'

        # Send the email
        response = ses.send_email(
            Source=sender,
            Destination={
                'ToAddresses': [
                    recipient,
                ],
            },
            Message={
                'Subject': {
                    'Data': subject,
                },
                'Body': {
                    'Text': {
                        'Data': body,
                    },
                },
            },
        )

        print("Email sent")
    
    else:
        print("Email not sent. Today's date is not the send date.")