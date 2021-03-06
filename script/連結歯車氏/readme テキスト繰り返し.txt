﻿
- テキスト繰り返し.anmについて -
	テキスト繰り返し.anmは連結歯車が作成した，テキストを繰り返したり数列を表示したりすることができる
	スクリプトです。
	
- 追加方法 -
	「exedit.auf」と同じ階層にある「script」フォルダまたはその中の適当なフォルダに
	.anmファイルを入れてください。
	
- 使い方 -
	○基本
		拡張編集に図形オブジェクトを置き，その一つ下のレイヤーにテキストオブジェクトを置きます。
		続いて図形のアニメーション効果からテキスト繰り返しを選択します。
		図形を表示しないように拡大率を0にします。
		必要ではありませんが，少しでも動作が軽くなるようにサイズは1，図形は四角形とします。
		「テキスト繰り返し」のパラメータ設定のコピペ用文字列
			<?mes(txrepet('ここにテキスト'))?>
		をコピーし，テキストオブジェクトに貼り付けます。
		「ここにテキスト」の文字列を繰り返したい文字列に変更し，
		「テキスト繰り返し」の繰返しの数字を変えるとその数だけ文字列が繰り返されます。
		
	○パラメータ
		◇繰返し
			繰り返す回数を指定します。
		◇文字数
			繰り返しを文字数で指定します。
		◇開始位置
			初めの文字の位置を指定します。
		◇変数n
			変数nの値を指定します。
		◇繰返し毎に改行
			この値だけ元の文字列が繰り返されるごとに改行します。
		◇文字毎に改行
			この値と同じ文字数ごとに改行します。
		◇行単位
			チェックを入れると繰返しパラメータで繰り返される対象が行になります。
		◇<...>を数えない
			チェックを入れると山括弧<>とその内側の文字が文字数にカウントされなくなります。
			制御文字を打ち込んだときはチェックを入れます。
		◇変数を利用
			チェックを入れると変数を扱えるようになります。
		◇繰返しインデックスi
			繰返しインデックスiは元の文字列がその位置までに何回繰り返されたかを表す数字です。
			式を入力して計算し，iに代入することができます。
		◇整数部の長さ
			数の整数部の長さを指定します。
		◇小数部の長さ
			数の小数部の長さを指定します。
		◇変数n（パラメータ設定）
			式を入力して計算し，nに代入することができます。
		◇フィールド0埋め
			チェックを入れると数の整数部の長さがパラメータ設定の「整数部の長さ」に満たないとき，
			不足する部分を半角スペースではなく0で埋めるようになります。
			
	○変数の入力
		「変数を利用」にチェックを入れたとき，テキストのiとnがそれぞれを表す数に変換されます。
		英数字のiとnをそのまま表示したい場合はそれぞれの前に$（半角のドル記号）を付けてください。
		また，$を表示したい場合は$$と入力してください。
	
	○変数の計算
		変数はi, nのほかにAviUtl専用の変数や関数及びLuaの関数も使うことができます。
		iとnの計算は独立して実行され，互いに干渉しません。
		
	○使用可能な主な変数や関数
		主に次のような変数や関数を使うことができます。
			◇繰返しインデックスi, 変数n
			◇lua.exe（AviUtl本体が入っているフォルダに存在）に書かれている変数，及び関数obj.rand
			◇Lua標準ライブラリの数学ライブラリにある変数や関数（以下URLを参照）
			　http://aviutlscript.wiki.fc2.com/wiki/Lua%E6%A8%99%E6%BA%96%E3%83%A9%E3%82%A4%E3%83%96%E3%83%A9%E3%83%AA

	○フォント
		初期フォントであるMS UI Gothicは数字は等幅ですが，他の文字の幅が異なるため，
		行の長さの違いでがたがたして見えることがあります。
		気になるときは等間隔モードにするか完全な等幅フォントを使います。
		ただし，等間隔モードはテキストが切れてしまうことがあります。
		有名なMSゴシックは完全な等幅フォントですが，
		源真ゴシック等幅や源柔ゴシック等幅ようなよりきれいなフォントを使うことをおすすめします。

- 使用上の注意 -
	「変数を利用」にチェックを入れたとき，「齪」と「齷」の2文字はスクリプトの内部変数として利用されるため，
	表示させることができません。
	文字数が多すぎてAviUtlがフリーズしないよう，一つの<?mes(txrepet('ここにテキスト'))?>で表示できる文字数を
	最大5000文字に制限しています。
	
- 履歴 -
	[2018/08/04]
	公開
	[2018/09/08]
	直にzipファイルを置いて共有する方法に変更
	ダウンロード時の文字化けに関する記述を削除