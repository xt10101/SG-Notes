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

1. Go to CloudWatch Dashboard. In the left-hand menu, click on "Dashboards"

2. If you have not created a Dashboard yet click "Create Dashboard" and give it a name and choose a widget configuration and press "next"

3. to add CPU tracking click "Aggregated by Instance Type" and tick "CPUUtilization". Then press Create Widget.

4. Go to your instance Click on the monitoring then Add to Dashboard
![add to dahsbaord lcoation](Imagenotes/スクリーンショット%202025-04-08%20100612.png)
   
#Find the widget that displays the metric you want to create an alarm for

5. Click the three-dot menu (⋮) in the top-right corner of the widget, click view in metrics, In graphed metrics press the alarm icon Select "Create Alarm"

6. Choose the:

Threshold type (Static or Anomaly detection)

Threshold value

Create a sns topic alarm that points to giving it a name and an email for the endpoint

Add an SNS topic to notify (or create a new one)

Give the alarm a name and description

Review everything and click Create Alarm