#!/usr/bin/env bash
# -*- coding : utf-8 -*-

## @~Japanese
## @file po2bats.sh
## @brief BATS ファイル生成スクリプト
## @details このプログラムの用途、用法など
## - PO ファイルから BATS ファイルを生成します。
## - BATS スクリプトを実行するには、パッケージ 'bats' をシステムにインストールしておく必要があります（参照：[Bats-core: Bash Automated Testing System (2018)](https://github.com/bats-core/bats-core)）。
## - このプログラムで ngettext（gettext の複数形版）コマンド対応の BATS ファイルを生成することはできません。
##
## @par このソフトウェアの著作権とライセンス
## SPDX-License-Identifier: MIT<br>
## SPDX-License-List: \<https://spdx.org/licenses/MIT.html\><br>
## <br>
## MIT License<br>
## <br>
## Copyright (c) 2018-2020 kim<br>
## <br>
## Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:<br>
## <br>
## The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.<br>
## <br>
## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
## @author kim \<kimkim19642004@yahoo.co.jp\>
## @~

## @~Japanese
## @brief プログラムのオリジナル名
## @details
## - この変数には、プログラムのオリジナル・ファイル名を設定してください。
## - 一般的に、ファイル名には、ファイルシステムが許容する範囲の任意文字列（制御文字やロケール依存文字を含む）が指定可能です。
## - プログラム引数 $0 は、そのような（言わば汚染された）文字列であるため、メッセージの出力に適していません。
## - このプログラムでは、プログラム引数 $0 の代わりに、この変数を使用してメッセージを出力します。
##
## @attention
## - このプログラムは、この変数の値を信用し、チェックしていません。
## - 変数の値に、制御文字やロケール依存文字を含めないでください。
## @~
_org_fname='po2bats.sh'

## @~Japanese
## このプログラムのメッセージカタログのための環境変数を設定します。
## @attention
## - TEXTDOMAINDIR が空の場合は、メッセージカタログの標準の検索ディレクトリー（Fedora では /usr/share/locale）下の po2bats.mo が参照されます。
## - このファイルを GNU Autotools で作成したインストーラーに組み込む場合は、ファイル名を po2bats.sh.in とし、インストーラーが自動的に TEXTDOMAINDIR と TEXTDOMAIN に値を設定できるようにしてください。
## @~
export TEXTDOMAINDIR='/usr/local/share/locale' TEXTDOMAIN='po2bats'

## @~Japanese
## プログラムの設計や保守管理の都合上、メジャー・バージョン番号が 3 以下ならプログラムを中止します。
## @attention
## - 以下のチェックは簡易的なものです。本格的なセキュリティチェックについては、このプログラムの呼び出し側で行ってください。
## - 以下の処理については、不明またはサポート外のシェルから呼び出だされた場合でも、なるべく構文解析エラーが発生しないよう、POSIX に準拠してコーディングしています。
## - 残念ながら、[dash](http://gondor.apana.org.au/~herbert/dash/) については、${BASH_VERSINFO[0]} のところで構文解析エラー 'Bad substitution' が表示され、プログラムの実行が中止してしまいます。
## - _i=${BASH_VERSINFO[0]} 以前に _i=0 としている理由は、_i=${BASH_VERSINFO[0]} の実行がスルーされた場合ても、確実に _i に 初期値 0 がセットされているようにするためです。
## - また、${_i} の値が整数の範囲を超えていたり、文字列であった場合には、((_i>3)) のところで構文エラーが発生しますが、このプログラムは、そのエラー表示を抑制しています。
## @~
_i=0; _i=${BASH_VERSINFO[0]}
[ "$1" = '<test_34>' ] && _i='123abc'
## @~Japanese
# 標準出力と標準エラー出力を捨てます。
# @attention このスクリプトのパーサーを rbash（または 'bash -r'）にした場合、/dev/null 出力が禁止されている旨のエラーが表示された。回避策としてバッファーに捨てることにした。
## @~
if ! _s=$( ((_i>3)) 2>&1 ) ; then
	{
		## AT_SETUP:test_34
		echo "${_org_fname}: $(gettext 'called from an unknown or unsupported shell')"
		echo 'Supported shells:'
		echo '  GNU Bash 4.0 or higher: https://www.gnu.org/software/bash/'
	} >&2;	exit 1
fi

## @~Japanese
# 呼出側シェルのオプションを検証します。
# @attention
# - このスクリプトのパーサーを rbash（または 'bash -r'）にした場合、/dev/null 出力が禁止されている旨のエラーが表示された。回避策としてバッファーに捨てることにした。
# - 'shopt restricted_shell' の戻り値は常に 1 であるため、実行エラーの検出に使えません。
# - 'kcov' では 'rbash' や 'bash -r' を使ったテストができません。
## @~
_s=$(shopt restricted_shell 2>&1)
[[ $1 = '<test_35>' ]] && _s=''
if [[ ${_s#restricted_shell$'\t'} != 'off' ]] ; then
	{
		## AT_SETUP:test_35
		echo "${_org_fname}: $(gettext 'Unsupported Shell Options')"
		echo "  ${_s}"
		gettext 'See'; echo ': https://www.gnu.org/software/bash/manual/bash.html'
	} >&2;	exit 1
fi

## @~Japanese
## プログラム終了時に自動的に呼び出される関数を登録します。
## @attention
## - 翻訳されたメッセージのチェックサム（メッセージ・ダイジェスト）生成処理で使用されるテンポラリー・ファイルは、まだ作成されていません。_chksum_temp_err に 0 以外の値を初期値として設定します。
## - BATS テンポラリー・ファイルは、まだ作成されていません。 _bats_temp_err に 0 以外の値を初期値として設定します。
## - declare readonly など、変数宣言をしないようにしてください。コマンドの組み合わせによっては、エラーの発生を見過す可能性が高いです。
## @~
_chksum_temp_err=1
_bats_temp_err=1
__atexit() {
	## @~Japanese
	## 翻訳されたメッセージのチェックサム（メッセージ・ダイジェスト）生成処理で使用されるテンポラリー・ファイルを削除します。
	## @attention
	## - 空白文字を含む文字列を正しく展開できるように、${_chksum_temp_name} をダブルコーテーションで必ず囲むようにしてください。
	## - rm コマンドに複数ファイル名を指定して、コマンド呼び出しに関するオーバーヘッド（呼び出し回数など）を減らすことを思いつきましたが、そこまで拘る必要もなく、不採用としました。
	## @~
	if ((_chksum_temp_err==0)) ; then
		rm -f "${_chksum_temp_name}"
		_chksum_temp_err=0
	fi

	## @~Japanese
	## BATS テンポラリー・ファイルを削除します。
	## @attention
	## - 空白文字を含む文字列を正しく展開できるように、${_bats_temp_name} をダブルコーテーションで必ず囲むようにしてください。
	## - rm コマンドに複数ファイル名を指定して、コマンド呼び出しに関するオーバーヘッド（呼び出し回数など）を減らすことを思いつきましたが、そこまで拘る必要もなく、不採用としました。
	## @~
	if ((_bats_temp_err==0)) ; then
		rm -f "${_bats_temp_name}"
		_bats_temp_err=0
	fi
}

## @~Japanese
## Ctrl-C 押下時や、このプログラムの終了時に自動的に呼ばれる処理を登録します。
## @~
trap __atexit EXIT

## @~Japanese
## このプログラム内において、GNU スタイルの getopt コマンドを通常モード（非完全 POSIX モード）で使用できるように設定してします。
## @attention Mac OSX や BSD 系の OS を使用している場合は、GNU スタイルの getopt コマンドをインストールしてください。
## @~
unset POSIXLY_CORRECT GETOPT_COMPATIBLE

## @~Japanese
## @brief ヘルプ表示関数
## @details ヘルプを標準出力に出力後、終了ステータス 0 でプログラムを終了します。
## @attention
## - ヘルプからの情報漏洩に注意してください。
## - このファイルを GNU Autotools で作成したインストーラーに組み込む場合は、ファイル名を po2bats.sh.in とし、インストーラーが自動的に URL、バグの報告先などの値を設定できるようにしてください。
## @~
__help() {
	## @~Japanese
	## - 制御コードに対するセキュリティを強化（制御コードを解釈しないように）しています。
	## - 出力レイアウトをイメージしやすいようにコーディングしています。
	## - コマンドの呼び出し回数を減らして処理速度を上げるよりも、セキュリティ強化を重視しています。
	##
	## @attention オプションの説明の表示位置について
	## - 先頭にスペースを 2 文字出力します。
	## - 次に、短いオプション、カンマおよびスペースのために、スペースを 4 文字出力します。
	## - 長いオプションは最長 8 文字までとします。
	## @~
	echo "$(gettext 'Usage'): ${_org_fname} [$(gettext 'OPTION')] PO BATS TEXTDOMAIN"
	gettext 'Generate BATS file from PO file'; echo ''
	echo ''
	gettext 'OPTION'; echo ':'
	echo "      --msgdir=TEXTDOMAINDIR  $(gettext 'Specify message catalog search path')"
	echo "      --msginfo               $(gettext 'Display message catalog information and exit')"
	echo "      --help                  $(gettext 'Display this help and exit')"
	echo "      --version               $(gettext 'Display version information and exit')"
	echo ''
	echo "PO: $(gettext 'Specify the name of an existing PO file')"
	echo "BATS: $(gettext 'Specify the name of a new BATS file')"
	echo 'TEXTDOMAIN,TEXTDOMAINDIR:'
	echo "  $(gettext 'See gettext command help for more information'): gettext --help"
	echo ''
	echo "URL: https://github.com/kimkim19642004/po2bats-autotools"
	gettext 'Report bugs to'; echo ': https://github.com/kimkim19642004/po2bats-autotools/issues'
	exit 0
}

## @~Japanese
## @brief バージョン情報表示関数
## @details バージョン情報を標準出力に出力後、終了ステータス 0 でプログラムを終了します。
## @attention
## - バージョン情報からの情報漏洩に注意してください。
## - このファイルを GNU Autotools で作成したインストーラーに組み込む場合は、ファイル名を po2bats.sh.in とし、インストーラーが自動的にパッケージ文字列、著作権などの値を設定できるようにしてください。
## @~
__version() {
	## @~Japanese
	## - 制御コードに対するセキュリティを強化（制御コードを解釈しないように）しています。
	## - 出力レイアウトをイメージしやすいようにコーディングしています。
	## - コマンドの呼び出し回数を減らして処理速度を上げるよりも、セキュリティ強化を重視しています。
	## @~
	echo "Name: ${_org_fname}"
	echo 'Package: po2bats 0.3.0'
	echo 'Copyright: Copyright (c) 2018-2020 kim'
	echo 'License:'
	echo '  SPDX-License-Identifier: MIT'
	echo '  SPDX-License-List: https://spdx.org/licenses/MIT.html'
	echo 'Supported shells:'
	echo '  GNU Bash 4.0 or higher: https://www.gnu.org/software/bash/'
	exit 0
}

## @~Japanese
## @brief メッセージカタログ情報表示関数
## @details メッセージカタログ情報を標準出力に出力後、終了ステータス 0 でプログラムを終了します。
## @attention メッセージカタログ情報からの情報漏洩に注意してください。
## @~
__msginfo() {
	## @~Japanese
	## - 制御コードに対するセキュリティを強化（制御コードを解釈しないように）しています。
	## - 出力レイアウトをイメージしやすいようにコーディングしています。
	## - コマンドの呼び出し回数を減らして処理速度を上げるよりも、セキュリティ強化を重視しています。
	## @~
	gettext ''
	echo "TEXTDOMAIN=${TEXTDOMAIN}"
	echo "TEXTDOMAINDIR=${TEXTDOMAINDIR}"
	echo "LANG=${LANG}"
	exit 0
}

## @~Japanese
## getopt コマンドのインストール状況をチェックします。
## @~
[[ $1 = '<test_28>' ]] && export GETOPT_COMPATIBLE='yes'
## @~Japanese
# 標準出力と標準エラー出力を捨てます。
# @attention このスクリプトのパーサーを rbash（または 'bash -r'）にした場合、/dev/null 出力が禁止されている旨のエラーが表示された。回避策としてバッファーに捨てることにした。
## @~
_s=$(getopt --test 2>&1); _i=$?
if ((_i != 4)) ; then
	{
		## AT_SETUP:test_28
		echo "${_org_fname}: getopt: $(gettext 'This GNU command is not installed, or invalid path/link settings.')"
		gettext 'See'; echo ': https://man.cx/getopt(1)'
	} >&2; exit 1
fi

## @~Japanese
## mktemp コマンドのインストール状況をチェックします。
## @attention テストカバレッジ 100% のコーディングを目標とし、コマンド 'gmktemp' をサポートしません。
## @~
_s='mktemp'
[[ $1 = '<test_29>' ]] && _s='mktemp_test'
## @~Japanese
# 標準出力と標準エラー出力を捨てます。
# @attention このスクリプトのパーサーを rbash（または 'bash -r'）にした場合、/dev/null 出力が禁止されている旨のエラーが表示された。回避策としてバッファーに捨てることにした。
## @~
if ! _s=$(${_s} --version 2>&1) ; then
	{
		## AT_SETUP:test_29
		echo "${_org_fname}: mktemp: $(gettext 'This GNU command is not installed, or invalid path/link settings.')"
		gettext 'See'; echo ': https://man.cx/mktemp(1)'
	} >&2; exit 1
fi

## @~Japanese
## realpath コマンドのインストール状況をチェックします。
## @attention テストカバレッジ 100% のコーディングを目標とし、コマンド 'grealpath' をサポートしません。
## @~
_s='realpath'
[[ $1 = '<test_30>' ]] && _s='realpath_test'
## @~Japanese
# 標準出力と標準エラー出力を捨てます。
# @attention このスクリプトのパーサーを rbash（または 'bash -r'）にした場合、/dev/null 出力が禁止されている旨のエラーが表示された。回避策としてバッファーに捨てることにした。
## @~
if ! _s=$(${_s} --version 2>&1) ; then
	{
		## AT_SETUP:test_30
		echo "${_org_fname}: realpath: $(gettext 'This GNU command is not installed, or invalid path/link settings.')"
		gettext 'See'; echo ': https://man.cx/realpath(1)'
	} >&2; exit 1
fi

## @~Japanese
## sha256sum コマンドのインストール状況をチェックします。
## @attention テストカバレッジ 100% のコーディングを目標とし、コマンド 'gsha256sum' をサポートしません。
## @~
_s='sha256sum'
[[ $1 = '<test_31>' ]] && _s='sha256sum_test'
## @~Japanese
# 標準出力と標準エラー出力を捨てます。
# @attention このスクリプトのパーサーを rbash（または 'bash -r'）にした場合、/dev/null 出力が禁止されている旨のエラーが表示された。回避策としてバッファーに捨てることにした。
## @~
if ! _s=$(${_s} --version 2>&1) ; then
	{
		## AT_SETUP:test_31
		echo "${_org_fname}: sha256sum: $(gettext 'This GNU command is not installed, or invalid path/link settings.')"
		gettext 'See'; echo ': https://man.cx/sha256sum(1)'
	} >&2; exit 1
fi

## @~Japanese
## chmod コマンドのインストール状況をチェックします。
## @attention テストカバレッジ 100% のコーディングを目標とし、コマンド 'gchmod' をサポートしません。
## @~
_s='chmod'
[[ $1 = '<test_32>' ]] && _s='chmod_test'
## @~Japanese
# 標準出力と標準エラー出力を捨てます。
# @attention このスクリプトのパーサーを rbash（または 'bash -r'）にした場合、/dev/null 出力が禁止されている旨のエラーが表示された。回避策としてバッファーに捨てることにした。
## @~
if ! _s=$(${_s} --version 2>&1) ; then
	{
		## AT_SETUP:test_32
		echo "${_org_fname}: chmod: $(gettext 'This GNU command is not installed, or invalid path/link settings.')"
		gettext 'See'; echo ': https://man.cx/chmod(1)'
	} >&2; exit 1
fi

## @~Japanese
## mv コマンドのインストール状況をチェックします。
## @attention テストカバレッジ 100% のコーディングを目標とし、コマンド 'gmv' をサポートしません。
## @~
_s='mv'
[[ $1 = '<test_33>' ]] && _s='mv_test'
## @~Japanese
# 標準出力と標準エラー出力を捨てます。
# @attention このスクリプトのパーサーを rbash（または 'bash -r'）にした場合、/dev/null 出力が禁止されている旨のエラーが表示された。回避策としてバッファーに捨てることにした。
## @~
if ! _s=$(${_s} --version 2>&1) ; then
	{
		## AT_SETUP:test_33
		echo "${_org_fname}: mv: $(gettext 'This GNU command is not installed, or invalid path/link settings.')"
		gettext 'See'; echo ': https://man.cx/mv(1)'
	} >&2; exit 1
fi

## @~Japanese
## メインプログラム開始。コマンドライン引数を解析します。
## @attention
## - このプログラムを bash などのシェルから起動する場合は、シェル側で規定されている終了ステータスの仕様を必ず確認してください。（参考：[Exit Codes With Special Meanings](http://tldp.org/LDP/abs/html/exitcodes.html)）
## - _i に ${#} による計算結果を格納し、_i を再利用します。
## @~
_i=${#}
if ((_i<1)) ; then
	## AT_SETUP:test_1
	## @~Japanese
	## - 制御コードに対するセキュリティを強化（制御コードを解釈しないように）しています。
	## - 出力レイアウトをイメージしやすいようにコーディングしています。
	## - コマンドの呼び出し回数を減らして処理速度を上げるよりも、セキュリティ強化を重視しています。
	## @~
	{
		echo "${_org_fname}: $(gettext 'missing file operand')"
		gettext 'Try the following command'; echo ": ${_org_fname} --help"
	} >&2 ; exit 1
elif ((_i>4)) ; then
	## AT_SETUP:test_2
	## @~Japanese
	## - 制御コードに対するセキュリティを強化（制御コードを解釈しないように）しています。
	## - 出力レイアウトをイメージしやすいようにコーディングしています。
	## - コマンドの呼び出し回数を減らして処理速度を上げるよりも、セキュリティ強化を重視しています。
	## @~
	_s=$(errno E2BIG)
	{
		echo "${_org_fname}: ${_s#* * }"
		gettext 'Try the following command'; echo ": ${_org_fname} --help"
	} >&2; exit 1
fi
## @~Japanese
## オプション引数を解析します。
## @attention 空白文字を含む文字列を正しく展開できるように、$@ をダブルコーテーションで必ず囲むようにしてください。
## @~
if ! _s=$(getopt --quiet --options "" --longoptions msgdir:,msginfo,help,version -- "$@" 2>&1) ; then
	## AT_SETUP:test_3
	## @~Japanese
	## - 制御コードに対するセキュリティを強化（制御コードを解釈しないように）しています。
	## - 出力レイアウトをイメージしやすいようにコーディングしています。
	## - コマンドの呼び出し回数を減らして処理速度を上げるよりも、セキュリティ強化を重視しています。
	## @~
	_s=$(errno EINVAL)
	{
		echo "${_org_fname}: ${_s#* * }"
		gettext 'Try the following command'; echo ": ${_org_fname} --help"
	} >&2; exit 1
fi
## @~Japanese
## 引数をリセットします。
## @attention 空白文字を含む文字列を正しく展開できるように、${_s} をダブルコーテーションで必ず囲むようにしてください。
## @~
eval set -- "${_s}"
_textdomaindir=''
## @~Japanese
## オプション引数に引数をリセットします。
## @attention 空白文字を含む文字列を正しく展開できるように、$1 をダブルコーテーションで必ず囲むようにしてください。
## @~
_i=0
while true; do
	case "$1" in
	'--msgdir' )
		## @~Japanese
		## メッセージカタログの検索ディレクトリーを保存します。
		## @attention このオプションの重複指定を禁止します。
		## @~
		if ((_i!=0)) ; then
			## AT_SETUP:test_36
			## @~Japanese
			## - 制御コードに対するセキュリティを強化（制御コードを解釈しないように）しています。
			## - 出力レイアウトをイメージしやすいようにコーディングしています。
			## - コマンドの呼び出し回数を減らして処理速度を上げるよりも、セキュリティ強化を重視しています。
			## @~
			_s=$(errno EINVAL)
			{
				echo "${_org_fname}: ${_s#* * }"
				gettext 'Try the following command'; echo ": ${_org_fname} --help"
			} >&2; exit 1
		else
			_i=1
		fi
		_textdomaindir=$2
		shift 2 ;;
	'--msginfo' )
		## AT_SETUP:test_6
		## @~Japanese
		## メッセージカタログ情報を出力します。
		## @~
		__msginfo ;;
	'--help' )
		## AT_SETUP:test_4
		## @~Japanese
		## ヘルプを出力します。
		## @~
		__help ;;
	'--version' )
		## AT_SETUP:test_5
		## @~Japanese
		## バージョン情報を出力します。
		## @~
		__version ;;
	'--' )
		## @~Japanese
		## オプションの終端記号が見つかった場合の処理
		## @attention
		## コマンドライン引数 \-\- が入力された場合、それ以降の引数は、オプション引数として解釈されません。
		## 例えば、\-\- \-\-help と入力された場合、\-\-help は、オプション引数として解釈されません。
		## @~
		shift
		break ;;
	esac
done
## @~Japanese
## @attention ${#} による計算結果は、以下で一度しか参照されないため、${#} を _i にコピーせず、直接評価します。
## @~
if ((${#}!=3)) ; then
	## AT_SETUP:test_7
	## @~Japanese
	## - 制御コードに対するセキュリティを強化（制御コードを解釈しないように）しています。
	## - 出力レイアウトをイメージしやすいようにコーディングしています。
	## - コマンドの呼び出し回数を減らして処理速度を上げるよりも、セキュリティ強化を重視しています。
	## @~
	_s=$(errno EINVAL)
	{
		echo "${_org_fname}: ${_s#* * }"
		gettext 'Try the following command'; echo ": ${_org_fname} --help"
	} >&2; exit 1
fi

## @~Japanese
## PO ファイルの指定に問題がないか？チェックします。
## @attention
## - 空白文字を含む文字列を正しく展開できるように、$1 をダブルコーテーションで必ず囲むようにしてください。
## - $1 で指定された文字列には制御コードが含まれている可能性があります。標準出力などへ出力する際は、十分に注意してください。
## @~
if ! _po_long_name=$(realpath -e "$1" 2>&1) ; then
	## AT_SETUP:test_8
	## @~Japanese
	## 簡潔なエラーメッセージを標準エラーに出力します。
	## @~
	echo "${_org_fname}: $(gettext 'PO error'):${_po_long_name##*:}" >&2
	exit 1
fi

## @~Japanese
## BATS ファイルの指定に問題がないか？チェックします。
## @attention
## - 空白文字を含む文字列を正しく展開できるように、$2 をダブルコーテーションで必ず囲むようにしてください。
## - $2 で指定された文字列には制御コードが含まれている可能性があります。標準出力などへ出力する際は、十分に注意してください。
## @~
if ! _bats_long_name=$(realpath "$2" 2>&1) ; then
	## AT_SETUP:test_9
	## @~Japanese
	## 簡潔なエラーメッセージを標準エラーに出力します。
	## @~
	echo "${_org_fname}: $(gettext 'BATS error'):${_bats_long_name##*:}" >&2
	exit 1
fi

## @~Japanese
## TEXTDOMAIN の指定に問題がないか？チェックします。
## @attention
## - TEXTDOMAIN に指定可能な文字列の最大バイト数を 255 に制限します。
## - TEXTDOMAIN に指定された文字列には制御コードが含まれている可能性があります。標準出力などへ出力する際は、十分に注意してください。
## @~
_s=$LANG
LANG='C'
if ((${#3}>255)) ; then
	## AT_SETUP:test_10
	LANG=${_s}
	## @~Japanese
	## 簡潔なエラーメッセージを標準エラーに出力します。
	## @~
	_s=$(errno EINVAL)
	echo "${_org_fname}: $(gettext 'TEXTDOMAIN error'): ${_s#* * }" >&2
	exit 1
fi
## @~Japanese
## TEXTDOMAINDIR の指定に問題がないか？チェックします。
## @attention
## - TEXTDOMAINDIR に指定可能な文字列の最大バイト数を 4095 に制限します。
## - TEXTDOMAINDIR に指定された文字列には制御コードが含まれている可能性があります。標準出力などへ出力する際は、十分に注意してください。
## @~
if ((${#_textdomaindir}>4095)) ; then
	## AT_SETUP:test_11
	LANG=${_s}
	## @~Japanese
	## 簡潔なエラーメッセージを標準エラーに出力します。
	## @~
	_s=$(errno EINVAL)
	echo "${_org_fname}: $(gettext 'TEXTDOMAINDIR error'): ${_s#* * }" >&2
	exit 1
fi
LANG=${_s}
_textdomain=$3

## @~Japanese
## 翻訳されたメッセージのチェックサム（メッセージ・ダイジェスト）生成処理で使用されるテンポラリー・ファイルを作成します。
## @attention 
## - このファイルは /tmp ディレクトリー下に作成され、OS の再起動時に自動的に削除されます。
## - 同一ユーザーが、このファイルに対して、他のプロセスから書き込み可能であることに注意してください。
## - coreutils パッケージの mktemp コマンドを使用してください。
## @~
[[ ${_textdomaindir} = '<test_12>' ]] && export TMPDIR=/tmp_test
_chksum_temp_name=$(mktemp 2>&1)
_chksum_temp_err=$?
if ((_chksum_temp_err !=0)) ; then
	## AT_SETUP:test_12
	{
		echo "${_org_fname}: ${_chksum_temp_name}"
		echo "TMPDIR: $TMPDIR" 
	} >&2; exit 1
fi

## @~Japanese
## BATS テンポラリー・ファイルを作成します。
## @attention 
## - このファイルは /tmp ディレクトリー下に作成され、OS の再起動時に自動的に削除されます。
## - 同一ユーザーが、このファイルに対して、他のプロセスから書き込み可能であることに注意してください。
## - coreutils パッケージの mktemp コマンドを使用してください。
## @~
[[ ${_textdomaindir} = '<test_13>' ]] && export TMPDIR=/tmp_test
_bats_temp_name=$(mktemp 2>&1)
_bats_temp_err=$?
if ((_bats_temp_err !=0)) ; then
	## AT_SETUP:test_13
	{
		echo "${_org_fname}: ${_bats_temp_name}"
		echo "TMPDIR: $TMPDIR"
	} >&2; exit 1
fi

## @~Japanese
## BATS テンポラリー・ファイルにヘッダー部分を上書きします（以前の書き込みは全て無効となります）。
## - 制御コードに対するセキュリティを強化（制御コードを解釈しないように）しています。
## - 出力レイアウトをイメージしやすいようにコーディングしています。
## - コマンドの呼び出し回数を減らして処理速度を上げるよりも、セキュリティ強化を重視しています。
## @attention
## - サブシェル内で実行されるグループコマンドのコードカバレッジを計測することができませんでした。
## - 試行錯誤した結果、サブシェル内で実行される関数のコードカバレッジを計測することができました。
## @~
[[ ${_textdomaindir} = '<test_14>' ]] && chmod -w "${_bats_temp_name}"
__header() {
	echo '#!/usr/bin/env bats'
	echo '################################################################################'
	echo "# $(gettext 'This file was automatically generated by po2bats.sh. Do not edit!')"
	echo '################################################################################'
	echo 'setup() {'
	echo "  export TEXTDOMAINDIR='${_textdomaindir}'"
	echo "  basecmd=\"gettext -e --domain=\"${_textdomain}\"\""
	echo '}'
}
if ! _s=$(__header 2>&1 > "${_bats_temp_name}") ; then
	## AT_SETUP:test_14
	## @~Japanese
	## 簡潔なエラーメッセージを標準エラーに出力します。
	## @~
	echo "${_org_fname}: $(gettext 'BATS tempfile error'):${_s##*:}" >&2
	exit 1
fi

## @~Japanese
## PO ファイルからデーターを読み込んで、BATS テンポラリー・ファイルに書き込みます。
## @attention
## - _s にエラーメッセージが格納されます。
## - サブシェル内で実行される一連のコマンドのコードカバレッジを計測することができませんでした。
## - 試行錯誤した結果、サブシェル内で実行される関数のコードカバレッジを計測することができました。
## @~
case "${_textdomaindir}" in
'<test_15>' ) chmod -w "${_bats_temp_name}" ;;
'<test_16>' ) chmod -w "${_chksum_temp_name}" ;;
'<test_17>' ) _po_long_name='abc' ;;
esac
__body () {
	## @~Japanese
	## - プログラムの状態変数 _n に初期値 0 （キーワード検索中という状態を表す）を設定します。
	## - メッセージ・カウンター _i に初期値 0 を設定します。
	## - 行カウンター _no に初期値 0 を設定します。
	## @~
	_n=0; _i=0; _no=0;
	if ! { while read -r _line ; do
		## @~Japanese
		## 行カウンターをインクリメントします。
		## @~
		((_no++))
		## @~Japanese
		## キーワードを検索するために先頭 4 文字を使用します。
		## @attention 高度なパターンマッチングは行いません。
		## @~
		_s=${_line:0:4}
		## @~Japanese
		## 空文字列が見つかった場合の処理
		## @~
		if ((${#_s}==0)) ; then
			## @~Japanese
			## _s が空で _n が 2 なら、キーワード msgstr の値の抽出は終わりです。
			## @~
			if ((_n==2)) ; then
				## @~Japanese
				## 「キーワード検索中」という状態をプログラムに通知します。
				## @~
				_n=0
				## @~Japanese
				## メッセージ・カウンターをインクリメントします。
				## @~
				((_i++))
				## @~Japanese
				## BATS テンポラリー・ファイルに追加書き込みします。
				## - 制御コードに対するセキュリティを強化（制御コードを解釈しないように）しています。
				## - 出力レイアウトをイメージしやすいようにコーディングしています。
				## - コマンドの呼び出し回数を減らして処理速度を上げるよりも、セキュリティ強化を重視しています。
				## @~
				if ! { if ((${#_msgid}==0)) ; then
						_s=${_msgstr##*Language: }
						_s=${_s%%\\*}
						_s="${_textdomaindir}/${_s}/LC_MESSAGES/${_textdomain}.mo"
						echo "@test \"ls ${_s}\" {"
						echo "  run ls \"${_s}\""
						echo "  [ \"\$status\" -eq 0 ]"
						echo '}'
						echo '@test "(null)" {'
					else
						echo "@test \"${_msgid}\" {"
					fi
					echo "  run \$basecmd \"${_msgid}\""
					## @~Japanese
					## 不要な情報を削除します。
					## @~
					_msgstr=${_msgstr//POT-Creation-Date:????????????????????????/}
					echo "  [ \"\$output\" = \"\$(echo -e \"${_msgstr}\")\" ]"
					echo '}' ; } >> "${_bats_temp_name}"; then exit 2
					## @~Japanese
					## BATS テンポラリー・ファイルの書き込み中にエラーが発生したことをプログラムに通知し、子プロセスを終了します。
					## @attention _s にエラーメッセージが格納されます。
					## @~
				fi
				## @~Japanese
				## 翻訳されたメッセージのチェックサム（メッセージ・ダイジェスト）生成処理で使用されるテンポラリー・ファイルに追加書き込みします。
				## @~
				if ! echo -en "${_msgstr}" >> "${_chksum_temp_name}" ; then
					## @~Japanese
					## 翻訳されたメッセージのチェックサム（メッセージ・ダイジェスト）生成処理で使用されるテンポラリー・ファイルの書き込み中にエラーが発生したことをプログラムに通知し、子プロセスを終了します。
					## @attention _s にエラーメッセージが格納されます。
					## @~
					exit 3
				fi
			fi
		## @~Japanese
		## キーワード msgid が見つかった場合の処理
		## @~
		elif [[ ${_s} = 'msgi' ]] ; then
			## @~Japanese
			## 「キーワード msgid が見つかった」という状態をプログラムに通知します。
			## @~
			_n=1
			## @~Japanese
			## キーワード msgid の値を抽出します。
			## @~
			_s=${_line:7}
			if ((${#_s}==0)) ; then
				## AT_SETUP:test_24
				## @~Japanese
				## 文字列が空の場合は、文字列抽出時に実行エラーが発生するので、その前にプログラムを終了します。
				## @~
				_s=$(errno EBADMSG)
				echo " ($(gettext 'line') ${_no}) ${_s#* * }"
				exit 1
			fi
			## @~Japanese
			## @attention 末尾の1文字を削除する別の方法 ${_s/%?/}
			## @~
			_msgid=${_s:0:-1}
		## @~Japanese
		## キーワード msgstr が見つかった場合の処理
		## @~
		elif [[ ${_s} = 'msgs' ]] ; then
			## @~Japanese
			## 「キーワード msgstr が見つかった」という状態をプログラムに通知します。
			## @~
			_n=2
			## @~Japanese
			## キーワード msgstr の値を抽出します。
			## @~
			_s=${_line:8}
			if ((${#_s}==0)) ; then
				## AT_SETUP:test_25
				## @~Japanese
				## 文字列が空の場合は、文字列抽出時に実行エラーが発生するので、その前にプログラムを終了します。
				## @~
				_s=$(errno EBADMSG)
				echo " ($(gettext 'line') ${_no}) ${_s#* * }"
				exit 1
			fi
			## @~Japanese
			## @attention 末尾の1文字を削除する別の方法 ${_s/%?/}
			## @~
			_msgstr=${_s:0:-1}
		## @~Japanese
		## 「キーワード msgid が見つかった」という状態を維持している場合の処理
		## @~
		elif ((_n==1)) ; then
			## @~Japanese
			## キーワード msgid の連続する値の抽出と連結を行います。
			## @~
			_s=${_line:1}
			if ((${#_s}>0)) ; then
				## @~Japanese
				## @attention 末尾の1文字を削除する別の方法 ${_s/%?/}
				## @~
				_msgid=${_msgid}${_s:0:-1}
			fi
		## @~Japanese
		## 「キーワード msgstr が見つかった」という状態を維持している場合の処理
		## @~
		elif ((_n==2)) ; then
			## @~Japanese
			## キーワード msgstr の連続する値の抽出と連結を行います。
			## @~
			_s=${_line:1}
			if ((${#_s}>0)) ; then
				## @~Japanese
				## @attention 末尾の1文字を削除する別の方法 ${_s/%?/}
				## @~
				_msgstr=${_msgstr}${_s:0:-1}
			fi
		fi
		## @~Japanese
		## PO ファイルの読み込み中エラーを検出した。
		## @attention _s にエラーメッセージが格納されます。
		## @~
	done 2>&1 < "${_po_long_name}"; }; then exit 1; fi
	if ((_i>0)) ; then
		## @~Japanese
		## テスト件数を BATS テンポラリー・ファイルに追加書き込みします。
		## @attention 子プロセス内で変数に設定された値は子プロセス内でしか参照できません。
		## @~
		[[ ${_textdomaindir} = '<test_26>' ]] && chmod -w "${_bats_temp_name}"
		if ! { echo "# $(gettext 'Test counts'): ${_i}" >> "${_bats_temp_name}" ; } 2>&1; then
			## AT_SETUP:test_26
			## @~Japanese
			## BATS テンポラリー・ファイルの書き込み中にエラーが発生したことをプログラムに通知し、子プロセスを終了します。
			## @attention 子プロセスを抜けると、echo コマンドの出力結果が _s に格納されています。
			## @~
			exit 2
		fi
	else
		## AT_SETUP:test_27
		## @~Japanese
		## メッセージが見つからなかったことをプログラムに通知します。
		## @~
		echo " $(gettext 'Message not found')"
		## @~Japanese
		## PO ファイルの読み込み中にエラーが発生したことをプログラムに通知し、子プロセスを終了します。
		## @attention 子プロセスを抜けると、echo コマンドの出力結果が _s に格納されています。
		## @~
		exit 1
	fi
}
_s=$(__body); _i=$?
case "${_i}" in
## @~Japanese
## PO ファイルの読み込み中にエラーが発生した場合の処理
## @~
1 )
	## AT_SETUP:test_17
	## @~Japanese
	## 簡潔なエラーメッセージを標準エラーに出力します。
	## @~
	echo "${_org_fname}: $(gettext 'PO error'):${_s##*:}" >&2
	exit 1 ;;
## @~Japanese
## BATS テンポラリー・ファイルの書き込みにエラーが発生した場合の処理
## @~
2 )
	## AT_SETUP:test_15
	## @~Japanese
	## 簡潔なエラーメッセージを標準エラーに出力します。
	## @~
	echo "${_org_fname}: $(gettext 'BATS tempfile error'):${_s##*:}" >&2
	exit 1 ;;
## @~Japanese
## 翻訳されたメッセージのチェックサム（メッセージ・ダイジェスト）生成処理で使用されるテンポラリー・ファイルの書き込み中にエラーが発生した場合の処理
## @~
3 )
	## AT_SETUP:test_16
	## @~Japanese
	## 簡潔なエラーメッセージを標準エラーに出力します。
	## @~
	echo "${_org_fname}: $(gettext 'CHECKSUM (message digest) tempfile error'):${_s##*:}" >&2
	exit 1 ;;
esac
## @~Japanese
## 翻訳されたメッセージのチェックサム（メッセージ・ダイジェスト）を生成します。
## @~
[[ ${_textdomaindir} = '<test_18>' ]] && _chksum_temp_name='abc'
if ! _s=$(sha256sum "${_chksum_temp_name}" 2>&1) ; then
	## AT_SETUP:test_18
	## @~Japanese
	## 簡潔なエラーメッセージを標準エラーに出力します。
	## @~
	echo "${_org_fname}: $(gettext 'CHECKSUM (message digest) tempfile error'):${_s##*:}" >&2
	exit 1
fi

## @~Japanese
## 翻訳されたメッセージのチェックサム（メッセージ・ダイジェスト）を BATS テンポラリー・ファイルに追加書き込みします。
## @~
[[ ${_textdomaindir} = '<test_19>' ]] && chmod -w "${_bats_temp_name}"
if ! _s=$({ printf "# %s: ${_s%% *}\n" "$(gettext 'CHECKSUM (message digest) for all translated messages')" >> "${_bats_temp_name}" ; } 2>&1) ; then
	## AT_SETUP:test_19
	## @~Japanese
	## 簡潔なエラーメッセージを標準エラーに出力します。
	## @~
	echo "${_org_fname}: $(gettext 'BATS tempfile error'):${_s##*:}" >&2
	exit 1
fi

## @~Japanese
## BATS テンポラリー・ファイルを BATS ファイルに移動します。
## @attention
## - 移動前に、BATS テンポラリー・ファイルの権限をデフォルトに設定し、さらに実行権限を付与します。
## - mv コマンドを使用することにより、移動元のファイル属性をそのままに、かつアトミックにファイルを移動します（このプログラムの多重起動に耐える設計となっている）。
## - _bats_long_name で指定されたファイルは既存の重要ファイルかも知れません。危険防止のため、既存の _bats_long_name で指定されたファイルの上書きを禁止します。
## - _bats_long_name で指定されたファイルを通常ファイルとして扱います。なお、_bats_long_name に「a/」「a//」などと指定された場合は「a」という名前のファイルが作成されます。
## - _bats_long_name で指定されたファイルの SELinux セキュリティコンテキストをデフォルト設定にします。
## @~
case "${_textdomaindir}" in
'<test_20>' ) _bats_temp_name='abc' ;;
'<test_21>' ) rm -f "${_bats_temp_name}" ;;
'<test_22>' ) echo 'abc' > "${_bats_long_name}" ;;
esac
if ! _s=$({ chmod +x "${_bats_temp_name}" && mv -nTZ "${_bats_temp_name}" "${_bats_long_name}"; } 2>&1) ; then
	## AT_SETUP:test_20
	## AT_SETUP:test_21
	## @~Japanese
	## このエラーメッセージを短くすると状況の把握が難しくたるため、内容をそのまま標準エラーに出力します。
	## @~
	echo "${_org_fname}: $(gettext 'cannot move tempfile to target BATS file'): ${_s}" >&2
	exit 1
fi
## @~Japanese
## 'mv -nTZ' コマンドが正常終了しても、_bats_temp_name が存在している場合はエラーとします。
## @~
if [[ ${_textdomaindir} = '<test_23>' ]] ; then
	echo 'abc' > "${_bats_temp_name}"
	rm -f "${_bats_long_name}"
fi
if [[ -e ${_bats_temp_name} ]]; then
	## @~Japanese
	## 簡潔なエラーメッセージを標準エラーに出力します。
	## @~
	if [[ -e ${_bats_long_name} ]]; then
		## AT_SETUP:test_22
		_s=$(errno EEXIST)
		echo "${_org_fname}: $(gettext 'cannot move tempfile to target BATS file'): ${_s#* * }" >&2
	else
		## AT_SETUP:test_23
		echo "${_org_fname}: $(gettext 'Target BATS file not found')" >&2
	fi
	exit 1
fi
