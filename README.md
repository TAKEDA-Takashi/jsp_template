# JSPをテンプレート化して利用するサンプル

## スタンドアローンでの実行

GitとMavenがパスに通っている環境で以下のコマンドを実行（動作確認は3.2.1）。

```
git clone https://github.com/MATSUMOTO-Takashi/jsp_template.git
cd jsp_template/jsp_template
mvn jetty:run
```

ブラウザからアクセス

```
http://localhost:8080/jsp_template/
```

## サンプルの説明

以下のwebappディレクトリにJSPファイルが含まれているため、以降はそこをルートとして階層を記載する。
またtaglib.jspは全てのjspでインクルードされるファイルとなっている。

```
+ jsp_template
  + src
    + main
      + webapp
        + WEB-INF
          + jsp
            + taglib.jsp
```


## 単純にパーツを分割して統合するケース

```
+ webapp
  + main.jsp
  + WEB-INF
    + jsp
      + common
        + footer.jsp
        + header.jsp
        + navigation.jsp
```

main.jspでc:importタグを利用することで、commonに配置されているパーツをインポートしている。

## インポートするテンプレートに値を渡したいケース

```
+ webapp
  + main2.jsp
  + WEB-INF
    + jsp
      + side_bar.jsp
      + common
        + footer.jsp
        + header.jsp
        + navigation.jsp
```

main2.jspでside_bar.jspをインポートしているが、その際にc:paramタグを利用することで値を渡すことができる。
またインポートされる側では ${param.foo} というように、paramオブジェクト経由で値を利用することができる。

## <a name="main3"></a>インポートするテンプレートを条件によって切り替えたいケース

```
+ webapp
  + main3.jsp
  + WEB-INF
    + jsp
      + templates
        + tmpl1.jsp
        + tmpl2.jsp
```

何らかの条件によってインポートするテンプレートを切り替えたい場合は、c:chooseタグやc:ifタグで分岐させることができる。
なおサンプルでは
[http://localhost:8080/jsp_template/main3.jsp?flag=1](http://localhost:8080/jsp_template/main3.jsp?flag=1 "ホスト名/IP、ポート番号は環境に合わせてね")
の、flagが1かそれ以外かでインポートされるテンプレートを切り替えている。

## サイト全体で共通のレイアウトを適用したいケース

ページレイアウトをテンプレート化し、各ページでレイアウトをインポートすることになる。

```
+ webapp
  + main4.jsp
  + WEB-INF
    + jsp
      + layout.jsp
      + common
        + footer.jsp
        + header.jsp
        + navigation.jsp
      + templates
        + switch_tmpl.jsp
        + tmpl1.jsp
        + tmpl2.jsp
```

テンプレート化されたレイアウトファイルがlayout.jsp。
ページ毎に異なる部分（ページタイトルやメインコンテンツなど）を変数にしている。
またヘッダーやフッターなどの共通部分もこれまで同様部品化してインポートしている。

このレイアウトを利用しているのがmain4.jspとなっていて、これまで通りc:importタグを使ってインポートしているだけ。
レイアウト側で変数となっていたタイトルやコンテンツはここで渡すことになる（つまり各ページではメインコンテンツに注力することができる）。

[インポートするテンプレートを条件によって切り替えたいケース](#main3)で条件分岐のタグを使って切り替えましたが、インポートするファイル名に変数を含めて動的に読み込むファイルを変える方法もあります。
それがswitch_tmpl.jspなわけですが、このサンプルのようにシステム側で用意した値であれば問題は起きないんですが、これが外部から渡されたパラメータであった場合には、ディレクトリトラバーサルの危険が伴いますので、くれぐれも利用の際には注意をしてください。
