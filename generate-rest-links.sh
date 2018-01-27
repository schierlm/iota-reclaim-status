#!/bin/bash -e

shopt -s extglob
rm -rf curl kerl
mkdir -p curl kerl

function DUMP {
	hash="$1"
	addr="$2"
	csum="$3"
	amount="$4"
	status="$5"
	amount=${amount##*(0)}
	echo '{"amount":"'$amount'", "status":"'$status'"}' > $hash/$addr.json
	cp $hash/$addr.json $hash/$addr$csum.json
	cat <<EOF > $hash/$addr.html
<html>
<head>
<link type="text/css" rel="stylesheet" href="../style.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>$addr</title>
</head>
<body>
<h3>$addr<span class="gg">$csum</span></h3>
<dl>
<dt>Amount:</dt><dd>$amount</dd>
<dt>Status:</dt><dd>$status</dd>
</dl>
EOF
	cp $hash/$addr.html $hash/$addr$csum.html
}

function CURL {
	DUMP curl "$1" "$2" "$3" "$4"
}

function KERL {
	DUMP kerl  "$1" "$2" "$3" "$4"
}

source curl.tsv
source kerl.tsv