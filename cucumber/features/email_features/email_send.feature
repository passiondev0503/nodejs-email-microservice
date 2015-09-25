Feature: the server receives a request to send an email

  Scenario Outline: send batch Email to an identity objects
    Given an authenticated identity in the app with <identity_id>
    Then a request is sent to <endpoint> to send an email <email> and returns <response>

    Examples:
      | identity_id              | endpoint                | email                                     | response                                  |
      | 01f0000000000000003f0001 | /api/notification/email | email/batch/valid_email_over_batch_limit.json   | email/valid_email_response.json           |
      | 01f0000000000000003f0001 | /api/notification/email | email/batch/valid_email_under_batch_limit.json  | email/valid_email_response.json           |
      | 01f0000000000000003f0002 | /api/notification/email | email/batch/invalid_to_email.json               | email/invalid_to_email_response.json      |
      | 01f0000000000000003f0003 | /api/notification/email | email/batch/invalid_from_email.json             | email/invalid_from_email_response.json    |
      | 01f0000000000000003f0001 | /api/notification/email | email/batch/empty_email.json                    | email/empty_email_response.json           |
      | 01f0000000000000003f0002 | /api/notification/email | email/batch/missing_email_message.json          | email/missing_email_message_response.json |

  Scenario Outline: send email to a single email address
    Given an authenticated identity in the app with <identity_id>
    Then a request is sent to <endpoint> to send an email <email> and returns <response>

    Examples:
      | identity_id              | endpoint                      | email                                           | response                                  |
      | 01f0000000000000003f0001 | /api/notification/singleEmail | email/single/valid_single_email.json            | email/valid_email_response.json           |
      | 01f0000000000000003f0002 | /api/notification/singleEmail | email/single/invalid_to_single_email.json       | email/invalid_to_email_response.json      |
      | 01f0000000000000003f0003 | /api/notification/singleEmail | email/single/missing_from_single_email.json     | email/valid_email_response.json           |
      | 01f0000000000000003f0001 | /api/notification/singleEmail | email/single/empty_single_email.json            | email/empty_email_response.json           |
      | 01f0000000000000003f0002 | /api/notification/singleEmail | email/single/missing_single_email_message.json  | email/missing_email_message_response.json |