# Terraform with aws

## Setting aws access from local

* Install AWS CLI

```bash
$ curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
$ sudo installer -pkg AWSCLIV2.pkg -target /

#to check
$ which aws
/usr/local/bin/aws 
$ aws --version
aws-cli/2.7.24 Python/3.8.8 Darwin/18.7.0 botocore/2.4.5

```

</br>

*  Get access key from IAM service and config in local

```bash
doquangtrung@Dos-MacBook-Pro terraform-aws % aws configure
AWS Access Key ID [None]: xxxxxxx
AWS Secret Access Key [None]: xxxxxx
Default region name [None]: ap-northeast-1
Default output format [None]:

#test setup
aws sts get-caller-identity

```
