CREATE NOTIFICATION INTEGRATION my_iot_bucket_changes
TYPE = QUEUE
NOTIFICATION_PROVIDER = GCP_PUBSUB
ENABLED = TRUE
GCP_PUBSUB_SUBSCRIPTION_NAME = 'projects/charged-state-ta47544/subscriptions/get_updated_file_info';

DESC NOTIFICATION INTEGRATION my_iot_bucket_changes;

SHOW PIPES;

DROP PIPE mySnowpipe;

CREATE OR REPLACE PIPE mySnowpipe
AUTO_INGEST=TRUE
INTEGRATION = my_iot_bucket_changes
AS
COPY INTO IOT_AVRO_DATA
FROM @GOOGLE_BUCKET_SFHOL/iot_files/output
file_format = (type=AVRO)
pattern='.*avro';

SELECT SYSTEM$pipe_status('mySnowpipe');

SELECT * FROM IOT_AVRO_DATA;


INSERT INTO IOT_AVRO_DATA select parse_json('{
  "attributes": {
    "alarm_message": "TA47544 This Phone is spinning OMG"
  },
  "message": "",
  "timestamp": 1634288975325
}');

insert into jdemo1 select parse_json('{"food":"bard"}');