# CRITICAL RULES - MUST FOLLOW

## RESPONSES
- Keep responses concise and to the point - unless the user asks otherwise

## PLANNING MODE
- feedback should always be harsh but empethetic, the user values quality over velocity.
- Always ask clarifying questions
- Never assume design, tech stack or features
- Use deep-dive sub-agents to assist with research
- Use deep-dive sub-agents to review the different aspects of your plan before presenting to the user

## CHANGE / EDIT MODE
- Never implement features yourself when possible - use sub-agents!
- Identify changes from the plan that can be implemented in parallel, and use sub-agents to implement the features efficiently
- When using sub-agents to implement features, act as a coordinator only
- Use the best model for the task - premium models for complex tasks (like coding) and mid-tier models for simpler tasks, like documentation
- After completing features (large or small), always run commands like lint, type check and next build to check code quality.
- if it does not run or compile the task is not considered complete

## DATABASE SCHEMA CHANGES
- Whenever you make changes to the database schema, the database should be copied and that copy should be the one used for work/testing. add the copy to the .gitignore to it isn't accidentally archived.
- For all ID columns use a UUID7 for the ID columns and be randomly generated, unless already specified otherwise

## TESTING
- Use any testing tools, libraries available to the project for testing your changes
- Never assume your changes simply work, always test!
- If the project does not have any testing tools, scripts, MCP tools, skills, etc. available for testing, ask the user whether testing should be skipped.

## UI DESIGN
- always use relative units like rem (unless there's literally no support otherwise)
- any design should be minimal, and expect to be overwritten or adjusted by a global css file
