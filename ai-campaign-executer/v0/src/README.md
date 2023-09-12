## The flow in the nutshell
- First you will setup a component that will extract the data from your Shopify account. You only need to insert login credentials to your Shopify account, while the component extracts all the data needed.
- The Transformation is already pre-defined for you and will create a dataset containing customer contact information and products to be recommended to each of them.
- The AI app utilizes the data created by the above mentioned transformation and generates a customized SMS message for them.
- As a final step, the dataset is being sent to Twilio to send a generated text message to each customer within the dataset.