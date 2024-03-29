[Do you think this information is useful? Collecting it took me some time. [Show your appreciation!](https://github.com/schierlm/donate-iota)]

# iota-reclaim-status
Tracking pending and completed reclaims by the IOTA Foundation

## Updated Status

Against their promises, the IOTA foundation did not publish details about the later reclaims to make it possible to update this status.
I'll give up and archive it now.

## Status (as of *2018-08-31* after nine batches)

[Reclaim Status thread in HelloIOTA forum](https://forum.helloiota.com/1242/Reclaim-Status)

**All reclaims that were filed before July 9th and had a unique destination seed have been processed in the first nine
reclaim batches. Reclaims with more than one destination seed can
[perform KYC now](https://blog.iota.org/iota-reclaim-identification-verification-process-e316647e06e6).
Claims filed later are pending for the next batch.**

**Since the IOTA Foundation has not released a list of addresses processed in the first nine batches yet,
the data in the table below is not split between CURL and KERL addresses. Also, the API cannot tell whether
an address has already been processed or not.**

*When you look at the table below, you will notice that more IOTA have been paid back (processed) than have been
frozen. Dom explained this in Discord: "there are several funds that are mixed together and that were also split",
probably referring to reclaims from the transition to the IOTA protocol which were paid from the same funds.*

| Progress    | CURL Addresses |         CURL IOTA | KERL Addresses |        KERL IOTA | Total Addresses |        Total IOTA |
| ---------   | --------------:| -----------------:| --------------:| ----------------:| ---------------:| -----------------:|
| Unclaimed   |                |                   |                |                  |           6572  |  -60445571724893  |
| KYC         |           105  |     368115527282  |            68  |    551295183153  |            173  |     919410710435  |
| Processed   |                |                   |                |                  |           2483  |  411289678100562  |
| *Total*     |         *7734* | *301620340961913* |         *1494* | *50143176124191* |          *9228* | *351763517086104* |


## Useful information

- [List of all reclaimable CURL addresses with status](curl.tsv)
- [List of all reclaimable KERL addresses with status](kerl.tsv)
- [List of all KERL Addresses frozen due to key reuse (large HTML page)](http://iota-reclaim-status.info.tm/key_reuse.html)
- [List of all untransitioned CURL addresses (large HTML page)](http://iota-reclaim-status.info.tm/untransitioned_curl.html)
- [Reclaim history with sources](history/0000-RECLAIM-HISTORY.md)


## API

To query whether an address is reclaimable and get the current status, a simple REST API is provided as well (in .json and .html format).

Just visit <code>http:<b></b>//iota-reclaim-status.info.tm/<i>HASH</i>/<i>ADDRESS</i>.<i>FORMAT</i></code>, 
where *HASH* is `curl` or `kerl`, *FORMAT* is `json` or `html`, and *ADDRESS* can be with or without checksum.

Examples:

- [CURL JSON without checksum](http://iota-reclaim-status.info.tm/curl/TANGLE999999999999999999999999999999999999999999999999999999999999999999999999999.json)
- [CURL JSON with checksum](http://iota-reclaim-status.info.tm/curl/TANGLE999999999999999999999999999999999999999999999999999999999999999999999999999NTOSCJZ9S.json)
- [CURL HTML without checksum](http://iota-reclaim-status.info.tm/curl/TANGLE999999999999999999999999999999999999999999999999999999999999999999999999999.html)
- [CURL HTML with checksum](http://iota-reclaim-status.info.tm/curl/TANGLE999999999999999999999999999999999999999999999999999999999999999999999999999NTOSCJZ9S.html)

- [KERL JSON without checksum](http://iota-reclaim-status.info.tm/kerl/999999999999999999999999999999999999999999999999999999999999999999999999999999999.json)
- [KERL JSON with checksum](http://iota-reclaim-status.info.tm/kerl/999999999999999999999999999999999999999999999999999999999999999999999999999999999A9BEONKZW.json)
- [CURL HTML without checksum](http://iota-reclaim-status.info.tm/kerl/999999999999999999999999999999999999999999999999999999999999999999999999999999999.html)
- [CURL HTML with checksum](http://iota-reclaim-status.info.tm/kerl/999999999999999999999999999999999999999999999999999999999999999999999999999999999A9BEONKZW.html)

When an address is not reclaimable, a 404 response containing only `{}` is returned:

- [unfrozen KERL address, JSON](http://iota-reclaim-status.info.tm/kerl/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA.json)

Otherwise, the JSON response contains the following fields:

- `amount`: Claimable amount in IOTA
- `status`: One or more of these:
  - `UNCLAIMED`: Address has not been claimed yet (or not yet been processed)
  - `KYC`: Address requires KYC before it will be processed
  - `CURL_USED`: Address has been used before, and has not been transitioned
  - `PROCESSED`: Not yet `:-(`
