### Resume Analyzer Data App

### Overview
The Keboola AI-Powered Resume Matching Automation Template is a solution that helps recruiters and HR professionals streamline their resume evaluation process. This template automates the retrieval of all open positions from LEVER (adding any HRIS with API is easy) and processes the applications for each job opening. It then uses a set of Gen AI prompts and algorithms to generate a match quality score for each resume, accompanied by detailed reasoning.


This template is focused on improving the efficiency and effectiveness of the hiring process. By automatically evaluating and scoring resumes, it allows recruiters to quickly identify the best matches for each position, saving significant time and resources. The detailed reasoning provided for each score helps in making informed hiring decisions and ensures transparency in the selection process. However, the final decision remains with the human HR team, ensuring that AI serves as a tool to assist rather than as a replacement for human judgment.


### Privacy, Security, and Governance
To ensure privacy and security, the application is accessible only to authorized HR personnel. This restriction helps maintain the confidentiality of resume data and ensures that sensitive information is handled appropriately. All data processed and stored within the template adheres to stringent privacy policies and security measures to protect candidate information.


Keboola’s robust governance and observability functionalities further enhance the template's reliability. With comprehensive tracking and logging, users can monitor data flows and transformations, ensuring data integrity and compliance with organizational policies and regulatory requirements.


### The Story
At Keboola, we always try to eat our own dog food. So, building an app to help our sourcing team to navigate piles of resumes for each role was a no-brainer. Thus far, the feedback is very positive and we already have some ideas how to make the app even more useful.
[TBD link to blog]


### Setup Requirements
To utilize this template, users only need to provide:
- **LEVER API Key**: This key enables the template to access job openings and candidate applications from the HRIS. To access it in Lever, go to Settings, Integrations, API Keys and just name your key (e.g., "keboola_integration"). Then, click on Select All Opportunities, copy the key, and confirm it with the Done button on the very bottom of the page. [TBD Step by step guide somewhere - monika has a section in help add it there].
- **OpenAI API Key**: This key enables the AI capabilities to generate responses. Get it in your [OpenAI account](https://platform.openai.com/api-keys).

