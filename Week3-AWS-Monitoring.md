# Week 3 AWS monitoring notes

## Links
Links to places(headers) in the document
- [Week 3 AWS monitoring notes](#week-3-aws-monitoring-notes)
  - [Links](#links)
      - [AWS Montioring creation steps:](#aws-montioring-creation-steps)
      - [AWS Alarm Creation Steps:](#aws-alarm-creation-steps)
_____




#### AWS Montioring creation steps:


1. Go to your instance, scroll down to the tabs and choose monitoring tab.

2. To enable detailed monitoring click on the Manage detailed monitoring tab then click the Detailed Monitoring tick box.

3. To create an EC2 Monitoring Dashboard, then create new, give the dashboard a name then press the create button and finally press the add to dashboard button.



#### AWS Alarm Creation Steps:

Go to CloudWatch Dashboard

n the left-hand menu, click on Dashboards

Find the widget that displays the metric you want to create an alarm for

Click the three-dot menu (⋮) in the top-right corner of the widget, click view in metrics

In graphed metrics press the alarm icon

Select "Create Alarm"


Choose the:

Threshold type (Static or Anomaly detection)

Threshold value

Create a sns topic alarm that points to giving it a name and an email for the endpoint

Add an SNS topic to notify (or create a new one)

Give the alarm a name and description

Review everything and click Create Alarm