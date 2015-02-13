# TODO

- TravisCI
- parameter checking
- README: examples, design, references
- publish gem
- rdoc/yard documentation
- support ruby 2.0? 1.9? (Only thing block this is I use required kwargs from 2.1)
- what should #delete return? boolean, Response object?
- associations between models. e.g. Account#files
- Folder#retrieve should distinguish between subfolders and files
- webhooks?
- implement multipart upload File#update
- integration tests that can be run locally

## Doc errors

- https://developers.kloudless.com/docs#files-list-recent-files takes multiple account ids
- https://developers.kloudless.com/docs#multipart-upload says files larger than 5MB, but https://developers.kloudless.com/docs#files-upload-a-file says 100MB
- https://developers.kloudless.com/docs#multipart-upload-initialize-multipart-session is missing required parent_id
- 'multipart_id' is better variable name? https://developers.kloudless.com/docs#multipart-upload-retrieve-multipart-session-information
- All other models are create, but Account is import https://developers.kloudless.com/docs#accounts-import-an-account
- events aren't really a collection. e.g. doesn't have total, count, only cursor
