# TODO

- TravisCI
- parameter checking
- README: examples, design, references
- define supported rubies
- publish gem
- rdoc/yard documentation
- move HTTP testing helpers to test_helper
- support ruby 2.0? 1.9?
- what should #delete return? boolean, response
- associations between models. e.g. Account#files
- better coverage on http tests
- Folder#retrieve should distinguish between subfolders and files
- webhooks?
- integration tests that can be run locally

## Doc errors

- https://developers.kloudless.com/docs#files-list-recent-files takes multiple account ids
- https://developers.kloudless.com/docs#multipart-upload says files larger than 5MB, but https://developers.kloudless.com/docs#files-upload-a-file says 100MB
- https://developers.kloudless.com/docs#multipart-upload-initialize-multipart-session is missing required parent_id
- 'multipart_id' is better variable name? https://developers.kloudless.com/docs#multipart-upload-retrieve-multipart-session-information
- All other models are create, but Account is import https://developers.kloudless.com/docs#accounts-import-an-account
- events aren't really a collection. e.g. doesn't have total, count, only cursor
