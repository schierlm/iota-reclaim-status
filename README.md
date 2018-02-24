# iota-reclaim-status
Tracking pending and completed reclaims by the IOTA Foundation


## Status (as of *2018-02-12*)

[Reclaim Status thread in HelloIOTA forum](https://forum.helloiota.com/1242/Reclaim-Status)

**All reclaims that were filed before February 7th and had a unique destination seed have been processed in the first two
reclaim batches. Reclaims with more than one destination seed are
[waiting for KYC](https://blog.iota.org/claims-and-reclaims-finalization-e692844c505a).
Claims filed later are pending for the next batch.**

**Since the IOTA Foundation has not released a list of addresses processed in the first two batches yet,
the data in the table below is not split between CURL and KERL addresses.**

| Progress    | CURL Addresses |         CURL IOTA | KERL Addresses |        KERL IOTA | Total Addresses |        Total IOTA |
| ---------   | --------------:| -----------------:| --------------:| ----------------:| ---------------:| -----------------:|
| Unclaimed   |                |                   |                |                  |           6995  |  141046910645264  |
| KYC         |            71  |     272283079967  |            49  |    102227712328  |            120  |     374510792295  |
| Processed   |                |                   |                |                  |           2113  |  210342095648545  |
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
