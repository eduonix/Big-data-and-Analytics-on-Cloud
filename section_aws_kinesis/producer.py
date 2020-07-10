import boto3
import json
import pprint

# Our input stream records, we are json serializing it using json.dumps

rec1 = json.dumps({"type":"sedan", "company":"Nissan", "color":"black", "year":"2013"})
rec2 = json.dumps({"type":"sedan", "company": "Pontiac", "color": "Blue", "year": "2015"})
rec3 = json.dumps({"type": "sedan", "company": "GMC", "color": "Black", "year": "2020"})

# Creating kinesis bulk records to be put into streams using the put_records structure
records = [
            {
                "Data": rec1,
                "PartitionKey": "sedan"
            },
            {
                "Data": rec2,
                "PartitionKey": "sedan"
            },
            {
                "Data": rec3,
                "PartitionKey": "sedan"
            }
           ]

# Creating kinesis connection
kinesis = boto3.client('kinesis')

# Sending records to the streams using put_records

# kinesis.put_record(StreamName='krish-ds', Data=json.dumps(record), PartitionKey='sedan')

pprint.pprint(kinesis.put_records(Records=records, StreamName='krish-ds'))
