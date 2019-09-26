# bootstraped-localstack
[localstack](https://github.com/localstack/localstack) container image that allows AWS CLI bootstrap command at runtime


## Usage

AWS CLI commands are sent to [localstack](https://github.com/localstack/localstack) through `AWSLOCAL_{service}` env vars. Example:

```bash
# localstack S3 with a bucket already created
docker run \
    -e SERVICES=s3 \
    -e AWSLOCAL_S3="mb s3://mybucket" \
    cobli/bootstrapped-localstack:0.10.3

# localstack SQS with a queue already created
docker run \
    -e SERVICES=sqs \
    -e AWSLOCAL_SQS="create-queue --queue-name MyQueue" \
    cobli/bootstrapped-localstack:0.10.3

```

`{service}` postfix are the same ones used in [`SERVICES`](https://github.com/localstack/localstack/tree/v0.10.3#configurations) env, uppercased.


* create a bucket: `AWSLOCAL_S3="mb s3://mybucket"`
* create a SQS queue: `AWSLOCAL_SQS="create-queue --queue-name MyQueue"`

Services tags (s3, sqs) are

Commands are executed (and only makes sense) in active localstack services


## Todo
* deploy multiple versions of localstack (fixed in 0.10.3)
* execute a set of commands instead of one
