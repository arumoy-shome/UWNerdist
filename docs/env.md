You need to setup your environment variables before you can retrieve data from
within the app. Here are the steps:

1. After you clone the repo, create a `.env` on the project root. Don't worry if
   Git doesn't pick this up, it's been added to the `.gitignore` file because we
   don't want to track it under version control and you will soon see why.
2. Head over to University of Waterloo's [Open Data
   API](https://uwaterloo.ca/api/register) page and complete the registration
   process.
3. Once you have registered, you should receive an API key.
4. Go back to the `.env`file that you previously created and add the following:
```
KEY=your_key
```

Save the file and you are done.
