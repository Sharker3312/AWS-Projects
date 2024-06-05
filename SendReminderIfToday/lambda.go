package main

import (
	"fmt"
	"time"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/ses"
)

func main() {
	reminder()
}

func reminder() {
	// Set the date to send the email
	sendDate := time.Date(2024, 6, 30, 0, 0, 0, 0, time.UTC)

	// Get the current date and time
	currentTime := time.Now()

	// Check if the current date is the same as the send date
	if currentTime.Year() == sendDate.Year() && currentTime.Month() == sendDate.Month() && currentTime.Day() == sendDate.Day() {
		// Create an SES client
		sess, err := session.NewSession(&aws.Config{
			Region: aws.String("us-east-2"),
		})
		if err != nil {
			fmt.Println("Error creating session:", err)
			return
		}

		sesClient := ses.New(sess)

		// Set the email parameters
		sender := "email@domain.com"
		recipient := "email@domain.com"
		subject := "Subject of the message - Info"
		body := "Hi"

		// Send the email
		input := &ses.SendEmailInput{
			Source: aws.String(sender),
			Destination: &ses.Destination{
				ToAddresses: []*string{
					aws.String(recipient),
				},
			},
			Message: &ses.Message{
				Subject: &ses.Content{
					Data: aws.String(subject),
				},
				Body: &ses.Body{
					Text: &ses.Content{
						Data: aws.String(body),
					},
				},
			},
		}

		_, err = sesClient.SendEmail(input)
		if err != nil {
			fmt.Println("Error sending email:", err)
			return
		}

		fmt.Println("Email sent")
	} else {
		fmt.Println("Email not sent. Today's date is not the send date.")
	}

}
