
# Cloudformation Stack

Use below script to create or delete cloudformation Stack

#### Make sure your aws cli is set-up with proper permissions
```
root@ecfd0174b5ad:/cf-asg-lt# aws sts get-caller-identity
{
    "UserId": "AIDA23L***",
    "Account": "74594****",
    "Arn": "arn:aws:iam::7459****:user/cf-svc-***"
}
```

### Create Stack

```
root@ecfd0174b5ad:/cf-asg-lt/scripts# ./bootstrap_cf.sh -h
Usage: ./bootstrap_cf.sh -n NAME -s INSTANCE_COUNT
Example: ./bootstrap_cf.sh -n awesome -s 2
  -n NAME        Name for the created resources (mandatory)
  -s INSTANCE_COUNT  Number of instances in the Auto Scaling Group
  -h                 Help



root@ecfd0174b5ad:/cf-asg-lt/scripts# ./bootstrap_cf.sh -n awesome -s 1
{
    "StackId": "arn:aws:cloudformation:me-central-1:745946109524:stack/awesome-stack/ff262260-9cce-11ef-a375-0ed4dc442dc3"
}
```

### Delete existing stack
```
root@ecfd0174b5ad:/cf-asg-lt/scripts# ./delete_cf.sh -h
Usage: ./delete_cf.sh -n NAME
Example: ./delete_cf.sh -n awesome
  -n NAME        Resource to be deleted(mandatory)
  -h             Help


root@ecfd0174b5ad:/cf-asg-lt/scripts# ./delete_cf.sh -n awesome
```


