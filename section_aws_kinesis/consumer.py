import boto3
import pprint

# Creating the kinesis connection

kinesis = boto3.client('kinesis')


# Get the shard iterator from the stream you are interested in

shard_iterator = kinesis.get_shard_iterator(StreamName='krish-ds',
                                            ShardId='shardId-000000000000',
                                            ShardIteratorType='TRIM_HORIZON'
                                            )

records = kinesis.get_records(ShardIterator=shard_iterator['ShardIterator'])

pprint.pprint(records)