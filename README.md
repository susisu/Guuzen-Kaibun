# 偶然回文
Wikipedia から偶然回文になっているものを見つける.

## 必要なもの
* [Node.js](https://nodejs.org/) または [io.js](https://iojs.org/)
* [MeCab](http://taku910.github.io/mecab/)
* [mecab-ipadic](http://taku910.github.io/mecab/) または [mecab-ipadic-NEologd](https://github.com/neologd/mecab-ipadic-neologd)
* [WP2TXT](https://github.com/yohasebe/wp2txt)

## 使い方
めんどくさかったのでパスなどをハードコーディングしてあるので,
環境に合わせて適宜 `bin/extract`, `./extract-all.sh`, `./assemble-all.sh` の中身を変えてください.

http://dumps.wikimedia.org/jawiki/ から Wikipedia のダンプ (最新ものもは `jawiki-latest-pages-articles.xml.bz2`) をダウンロードし,
WP2TXT を使って
``` shell
wp2txt -i data/jawiki-latest-pages-articles.xml.bz2 -o data/txt
```
などとしてテキストファイルに展開.

あとは
``` shell
./extract-all.sh
```
とすると `data/results` 以下に抽出された回文が吐き出されます.

集計するには
``` shell
./assemble-all.sh
```
とすると `data/results` 以下のファイルから全回文を集めたファイル `data/results.txt` と,
音数の頻度分布 `data/counts.txt` が得られます.

## 注意点
適当に設定してあるため, MeCab のバッファが足りなくなる場合があるので, 必要なら `bin/extract` の
``` javascript
palindrome.mecabCommand = "mecab -d /usr/local/lib/mecab/dic/mecab-ipadic-neologd -b 65536";
```
みたいな部分で `-b <バッファサイズ>` とか変える.

## 参考
* [形態素解析エンジンMeCabにて文章中から短歌を抽出 - inaniwa3's blog](http://inaniwa3.hatenablog.com/entry/2015/01/01/152927)
