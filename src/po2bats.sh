#!/bin/env bash

## @~Japanese
## @file po2bats.sh
## @brief BATS ファイル生成スクリプト
## @details 本プログラムの用途、用法など
## - PO ファイルから BATS ファイルを生成します。
## - BATS スクリプトを実行するには [bats](https://github.com/sstephenson/bats) をシステムにインストールしておく必要があります。
## - 本プログラムで ngettext（gettext の複数形版）コマンド対応の BATS ファイルを生成することはできません。
##
## @par このソフトウェアの著作権とライセンス
## SPDX-License-Identifier: MIT<br>
## SPDX-License-List: \<https://spdx.org/licenses/MIT.html\><br>
## <br>
## MIT License<br>
## <br>
## Copyright (c) 2018 kim<br>
## <br>
## Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:<br>
## <br>
## The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.<br>
## <br>
## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
## @author kim \<kimkim19642004@yahoo.co.jp\>
## @~

## @~Japanese
## プログラム終了時に自動的に呼び出される関数を登録します。
## @attention 
## - 翻訳されたメッセージのチェックサム（メッセージ・ダイジェスト）生成処理で使用されるテンポラリー・ファイルは、まだ作成されていません。_chksum_temp_err に 0 以外の値を初期値として設定します。
## - BATS テンポラリー・ファイルは、まだ作成されていません。 _bats_temp_err に 0 以外の値を初期値として設定します。
## - declare readonly など、変数宣言をしないようにしてください。コマンドの組み合わせによっては、エラーの発生を見過す可能性が高いです。
## @~
_chksum_temp_err=1
_bats_temp_err=1
function __atexit() {
	## @~Japanese
	## 翻訳されたメッセージのチェックサム（メッセージ・ダイジェスト）生成処理で使用されるテンポラリー・ファイルを削除します。
	## @attention
	## - 空白文字を含む文字列を正しく展開できるように、${_chksum_temp_name} をダブルコーテーションで必ず囲むようにしてください。
	## - rm コマンドに複数ファイル名を指定して、コマンド呼び出しに関するオーバーヘッド（呼び出し回数など）を減らすことを検討しましたが、結果、不採用としました。
	## @~
	if [ ${_chksum_temp_err} -eq 0 ] ; then
		rm -f "${_chksum_temp_name}"
	fi

	## @~Japanese
	## BATS テンポラリー・ファイルを削除します。
	## @attention
	## - 空白文字を含む文字列を正しく展開できるように、${_bats_temp_name} をダブルコーテーションで必ず囲むようにしてください。
	## - rm コマンドに複数ファイル名を指定して、コマンド呼び出しに関するオーバーヘッド（呼び出し回数など）を減らすことを検討しましたが、結果、不採用としました。
	## @~
	if [ ${_bats_temp_err} -eq 0 ] ; then
		rm -f "${_bats_temp_name}"
	fi
}
trap __atexit EXIT

## @~Japanese
## 本プログラムのメッセージカタログのための環境変数を設定します。
## @attention
## - TEXTDOMAINDIR が空の場合は、メッセージカタログの標準の検索ディレクトリー（Fedora では /usr/share/locale）下の po2bats.mo が参照されます。
## - このファイルを GNU Autotools で作成したインストーラーに組み込む場合は、ファイル名を po2bats.sh.in とし、インストーラーが自動的に TEXTDOMAINDIR と TEXTDOMAIN に値を設定できるようにしてください。
## - コマンド呼び出しに関するオーバーヘッド（呼び出し回数など）を減らしています。
## @~
export TEXTDOMAINDIR='/usr/local/share/locale' TEXTDOMAIN='po2bats'

## @~Japanese
## @brief プログラムのオリジナル名
## @details
## - この変数には、プログラムのオリジナル・ファイル名を設定してください。
## - 一般的に、ファイル名には、ファイルシステムが許容する範囲の任意文字列（制御文字やロケール依存文字を含む）が指定可能です。
## - プログラム引数 $0 は、そのような（言わば汚染された）文字列であるため、メッセージの出力に適していません。
## - 本プログラムでは、プログラム引数 $0 の代わりに、この変数を使用してメッセージを出力します。
##
## @attention
## - 本プログラムは、この変数の値を信用し、チェックしていません。
## - 変数の値に、制御文字やロケール依存文字を含めないでください。
## @~
_org_fname='po2bats.sh'

## @~Japanese
## @brief ヘルプ表示関数
## @details ヘルプを標準出力に出力後、終了ステータス 0 でプログラムを終了します。
## @attention
## - ヘルプからの情報漏洩に注意してください。
## - このファイルを GNU Autotools で作成したインストーラーに組み込む場合は、ファイル名を po2bats.sh.in とし、インストーラーが自動的に URL、バグの報告先などの値を設定できるようにしてください。
## @~
function __help() {
	## @~Japanese
	## - 制御コードに対するセキュリティを強化（制御コードを解釈しないように）しています。
	## - 出力レイアウトをイメージしやすいようにコーディングしています。
	## - コマンドの呼び出し回数を減らして処理速度を上げるよりも、セキュリティ強化を重視しています。
	##
	## @attention オプションの説明の表示位置について
	## - 先頭にスペースを 2 文字出力する。
	## - 次に、短いオプション、カンマおよびスペースのために、スペースを 4 文字出力する。
	## - 長いオプションは最長 8 文字までとする。
	## @~
	echo "$(gettext 'Usage'): ${_org_fname} [$(gettext 'OPTION')] PO BATS TEXTDOMAIN"
	echo "$(gettext 'Generate BATS file from PO file')"
	echo ''
	echo "$(gettext 'OPTION'):"
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
	echo "$(gettext 'Report bugs to'): kim <kimkim19642004@yahoo.co.jp>"
	exit 0
}

## @~Japanese
## @brief バージョン情報表示関数
## @details バージョン情報を標準出力に出力後、終了ステータス 0 でプログラムを終了します。
## @attention
## - バージョン情報からの情報漏洩に注意してください。
## - このファイルを GNU Autotools で作成したインストーラーに組み込む場合は、ファイル名を po2bats.sh.in とし、インストーラーが自動的にパッケージ文字列、著作権などの値を設定できるようにしてください。
## @~
function __version() {
	## @~Japanese
	## - 制御コードに対するセキュリティを強化（制御コードを解釈しないように）しています。
	## - 出力レイアウトをイメージしやすいようにコーディングしています。
	## - コマンドの呼び出し回数を減らして処理速度を上げるよりも、セキュリティ強化を重視しています。
	## @~
	echo "Name: ${_org_fname}"
	echo 'Package: po2bats 0.1.0'
	echo 'Copyright: Copyright (c) 2018 kim'
	echo 'License:'
	echo '  SPDX-License-Identifier: MIT'
	echo '  SPDX-License-List: https://spdx.org/licenses/MIT.html'
	exit 0
}

## @~Japanese
## @brief メッセージカタログ情報表示関数
## @details メッセージカタログ情報を標準出力に出力後、終了ステータス 0 でプログラムを終了します。
## @attention メッセージカタログ情報からの情報漏洩に注意してください。
## @~
function __msginfo() {
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
## メインプログラム開始。コマンドライン引数を解析します。
## @attention このプログラムを bash などのシェルから起動する場合は、シェル側で規定されている終了ステータスの仕様を必ず確認してください。（参考：[Exit Codes With Special Meanings](http://tldp.org/LDP/abs/html/exitcodes.html)）
## @~
if [ $# -lt 1 ] ; then
	## @~Japanese
	## - 制御コードに対するセキュリティを強化（制御コードを解釈しないように）しています。
	## - 出力レイアウトをイメージしやすいようにコーディングしています。
	## - コマンドの呼び出し回数を減らして処理速度を上げるよりも、セキュリティ強化を重視しています。
	## @~
	{
		echo "${_org_fname}: $(gettext 'missing file operand')"
		echo "$(gettext 'Try the following command'): ${_org_fname} --help"
	} >&2
	exit 1
elif [ $# -gt 4 ] ; then
	## @~Japanese
	## - 制御コードに対するセキュリティを強化（制御コードを解釈しないように）しています。
	## - 出力レイアウトをイメージしやすいようにコーディングしています。
	## - コマンドの呼び出し回数を減らして処理速度を上げるよりも、セキュリティ強化を重視しています。
	## @~
	_s=$(errno E2BIG)
	{
		echo "${_org_fname}: ${_s#* * }"
		echo "$(gettext 'Try the following command'): ${_org_fname} --help"
	} >&2
	exit 1
fi
## @~Japanese
## オプション引数を解析します。
## @attention 空白文字を含む文字列を正しく展開できるように、$@ をダブルコーテーションで必ず囲むようにしてください。
## @~
_s=$(getopt --options "" --longoptions msgdir:,msginfo,help,version -- "$@" 2>&1)
if [ $? -ne 0 ] ; then
	## @~Japanese
	## 行番号を付けて、getopt コマンドのエラーメッセージを標準エラーに出力します。
	## @~
	echo "${_org_fname}: $(gettext 'line') $LINENO: ${_s}" >&2
	exit 1
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
while true; do
	case "$1" in
	--msgdir )
		## @~Japanese
		## メッセージカタログの検索ディレクトリーを保存します。
		## @attention 同じオプションが複数回見つかった場合は、その回数分だけ以下の処理が呼び出されます。
		## @~
		_textdomaindir=$2
		shift 2 ;;
	--msginfo )
		## @~Japanese
		## メッセージカタログ情報を出力します。
		## @~
		__msginfo ;;
	--help )
		## @~Japanese
		## ヘルプを出力します。
		## @~
		__help ;;
	--version )
		## @~Japanese
		## バージョン情報を出力します。
		## @~
		__version ;;
	-- )
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
if [ $# -ne 3 ] ; then
	## @~Japanese
	## - 制御コードに対するセキュリティを強化（制御コードを解釈しないように）しています。
	## - 出力レイアウトをイメージしやすいようにコーディングしています。
	## - コマンドの呼び出し回数を減らして処理速度を上げるよりも、セキュリティ強化を重視しています。
	## @~
	_s=$(errno EINVAL)
	{
		echo "${_org_fname}: ${_s#* * }"
		echo "$(gettext 'Try the following command'): ${_org_fname} --help"
	} >&2
	exit 1
fi

## @~Japanese
## PO ファイルの指定に問題がないか？チェックします。
## @attention
## - 空白文字を含む文字列を正しく展開できるように、$1 をダブルコーテーションで必ず囲むようにしてください。
## - $1 で指定された文字列には制御コードが含まれている可能性があります。標準出力などへ出力する際は、十分に注意してください。
## @~
_po_long_name=$(realpath -e "$1" 2>&1)
if [ $? -ne 0 ] ; then
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
_bats_long_name=$(realpath "$2" 2>&1)
if [ $? -ne 0 ] ; then
	## @~Japanese
	## 簡潔なエラーメッセージを標準エラーに出力します。
	## @~
	echo "${_org_fname}: $(gettext 'BATS error'):${_bats_long_name##*:}" >&2
	exit 1
fi

## @~Japanese
## TEXTDOMAIN の指定に問題がないか？チェックします。
## @attention
## - TEXTDOMAIN は MO ファイルのファイル名から拡張子 .mo を除いたファイル名です。ファイル名として有効な文字列を指定してください。
## - TEXTDOMAIN の最大バイト数は、ファイル名の最大バイト数 255 から拡張子 .mo のバイト数 3 を引いた 252 です。
## - TEXTDOMAIN で指定された文字列の正当性は、実際に BATS ファイルを出力して確認してください。
## - TEXTDOMAIN で指定された文字列には制御コードが含まれている可能性があります。標準出力などへ出力する際は、十分に注意してください。
## @~
_s=$LANG
LANG='C'
if [ ${#3} -gt 252 ] ; then
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
## - TEXTDOMAINDIR はディレクトリー名です。ディレクトリー名として有効な文字列を指定してください。
## - TEXTDOMAINDIR の最大バイト数は、パス名の最大バイト数 4095 から最小バイト数で構成されるファイル名 ?.mo のバイト数 4 を引いた 4091 です。
## - TEXTDOMAINDIR で指定された文字列の正当性は、実際に BATS ファイルを出力して確認してください。
## - TEXTDOMAINDIR で指定された文字列には制御コードが含まれている可能性があります。標準出力などへ出力する際は、十分に注意してください。
## @~
if [ ${#_textdomaindir} -gt 4091 ] ; then
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
## @~
_chksum_temp_name=$(mktemp 2>&1)
_chksum_temp_err=$?
if [ ${_chksum_temp_err} -ne 0 ] ; then
	## @~Japanese
	## 行番号を付けて、mktemp コマンドのエラーメッセージを標準エラーに出力します。
	## @~
	echo "${_org_fname}: $(gettext 'line') $LINENO: ${_chksum_temp_name}" >&2
	exit 1
fi

## @~Japanese
## BATS テンポラリー・ファイルを作成します。
## @attention 
## - このファイルは /tmp ディレクトリー下に作成され、OS の再起動時に自動的に削除されます。
## - 同一ユーザーが、このファイルに対して、他のプロセスから書き込み可能であることに注意してください。
## @~
_bats_temp_name=$(mktemp 2>&1)
_bats_temp_err=$?
if [ ${_bats_temp_err} -ne 0 ] ; then
	## @~Japanese
	## 行番号を付けて、mktemp コマンドのエラーメッセージを標準エラーに出力します。
	## @~
	echo "${_org_fname}: $(gettext 'line') $LINENO: ${_bats_temp_name}" >&2
	exit 1
fi
## @~Japanese
## BATS テンポラリー・ファイルにヘッダー部分を上書きします（以前の書き込みは全て無効となります）。
## - 制御コードに対するセキュリティを強化（制御コードを解釈しないように）しています。
## - 出力レイアウトをイメージしやすいようにコーディングしています。
## - コマンドの呼び出し回数を減らして処理速度を上げるよりも、セキュリティ強化を重視しています。
## @~
_s=$({
	echo '#!/bin/env bats'
	echo '################################################################################'
	echo "# $(gettext 'This file was automatically generated by po2bats.sh. Do not edit!')"
	echo '################################################################################'
	echo 'setup() {'
	echo "  export TEXTDOMAINDIR='${_textdomaindir}'"
	echo "  basecmd=\"gettext -e --domain=\"${_textdomain}\"\""
	echo '}'
} 2>&1 > "${_bats_temp_name}")
if [ $? -ne 0 ] ; then
	## @~Japanese
	## 簡潔なエラーメッセージを標準エラーに出力します。
	## @~
	echo "${_org_fname}: $(gettext 'BATS tempfile error'):${_s##*:}" >&2
	exit 1
fi

## @~Japanese
## PO ファイルからデーターを読み込んで、BATS テンポラリー・ファイルに書き込みます。
## @attention _s にエラーメッセージが格納されます。
## @~
_s=$(
	## @~Japanese
	## - プログラムの状態変数 _n に初期値 0 （キーワード検索中という状態を表す）を設定します。
	## - カウンター _i に初期値 0 を設定します。
	## @~
	_n=0
	_i=0
	while read -r _line ; do
		## @~Japanese
		## キーワードを検索するために先頭 4 文字を使用します。
		## @~
		_s=${_line:0:4}
		## @~Japanese
		## 空文字列が見つかった場合の処理
		## @~
		if [ -z "${_s}" ] ; then
			## @~Japanese
			## _s が空で _n が 2 なら、キーワード msgstr の値の抽出は終わりです。
			## @~
			if [ ${_n} -eq 2 ] ; then
				## @~Japanese
				## 「キーワード検索中」という状態をプログラムに通知します。
				## @~
				_n=0
				## @~Japanese
				## カウンターをインクリメントします。
				## @~
				((_i++))
				## @~Japanese
				## BATS テンポラリー・ファイルに追加書き込みします。
				## - 制御コードに対するセキュリティを強化（制御コードを解釈しないように）しています。
				## - 出力レイアウトをイメージしやすいようにコーディングしています。
				## - コマンドの呼び出し回数を減らして処理速度を上げるよりも、セキュリティ強化を重視しています。
				## @~
				{
					echo "@test \"${_msgid}\" {"
					echo "  run \$basecmd \"${_msgid}\""
					echo "  [ \"\$output\" = \"\$(echo -e \"${_msgstr}\")\" ]"
					echo '}'
				} >> "${_bats_temp_name}"
				if [ $? -ne 0 ] ; then
					## @~Japanese
					## BATS テンポラリー・ファイルの書き込み中にエラーが発生したことをプログラムに通知し、子プロセスを終了します。
					## @attention _s にエラーメッセージが格納されます。
					## @~
					exit 2
				fi
				## @~Japanese
				## 翻訳されたメッセージのチェックサム（メッセージ・ダイジェスト）生成処理で使用されるテンポラリー・ファイルに追加書き込みします。
				## @~
				echo -en "${_msgstr}" >> "${_chksum_temp_name}"
				if [ $? -ne 0 ] ; then
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
		elif [ "${_s}" = 'msgi' ] ; then
			## @~Japanese
			## 「キーワード msgid が見つかった」という状態をプログラムに通知します。
			## @~
			_n=1
			## @~Japanese
			## キーワード msgid の値を抽出します。
			## @~
			_s=${_line:7}
			if [ -n "${_s}" ] ; then
				_msgid=${_s:0:-1}
			else
				_msgid=''
			fi
		## @~Japanese
		## キーワード msgstr が見つかった場合の処理
		## @~
		elif [ "${_s}" = 'msgs' ] ; then
			## @~Japanese
			## 「キーワード msgstr が見つかった」という状態をプログラムに通知します。
			## @~
			_n=2
			## @~Japanese
			## キーワード msgstr の値を抽出します。
			## @~
			_s=${_line:8}
			if [ -n "${_s}" ] ; then
				_msgstr=${_s:0:-1}
			else
				_msgstr=''
			fi
		## @~Japanese
		## 「キーワード msgid が見つかった」という状態を維持している場合の処理
		## @~
		elif [ ${_n} -eq 1 ] ; then
			## @~Japanese
			## キーワード msgid の連続する値の抽出と連結を行います。
			## @~
			_s=${_line:1}
			if [ -n "${_s}" ] ; then
				_msgid=${_msgid}${_s:0:-1}
			fi
		## @~Japanese
		## 「キーワード msgstr が見つかった」という状態を維持している場合の処理
		## @~
		elif [ ${_n} -eq 2 ] ; then
			## @~Japanese
			## キーワード msgstr の連続する値の抽出と連結を行います。
			## @~
			_s=${_line:1}
			if [ -n "${_s}" ] ; then
				_msgstr=${_msgstr}${_s:0:-1}
			fi
		fi
	done 2>&1 < "${_po_long_name}"
	## @~Japanese
	## PO ファイルの読み込み中エラーを検出します。
	## @attention _s にエラーメッセージが格納されます。
	## @~
	if [ $? -ne 0 ] ; then
		exit 1
	fi
	if [ ${_i} -gt 0 ] ; then
		## @~Japanese
		## テスト件数を BATS テンポラリー・ファイルに追加書き込みします。
		## @attention 子プロセス内で変数に設定された値は子プロセス内でしか参照できません。
		## @~
		echo "# $(gettext 'Test counts'): ${_i}" 2>&1 >> "${_bats_temp_name}"
		if [ $? -ne 0 ] ; then
			## @~Japanese
			## BATS テンポラリー・ファイルの書き込み中にエラーが発生したことをプログラムに通知し、子プロセスを終了します。
			## @attention 子プロセスを抜けると、echo コマンドの出力結果が _s に格納されています。
			## @~
			exit 2
		fi
	else
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
)
_n=$?
case ${_n} in
## @~Japanese
## PO ファイルの読み込み中にエラーが発生した場合の処理
## @~
1 )
	## @~Japanese
	## 簡潔なエラーメッセージを標準エラーに出力します。
	## @~
	echo "${_org_fname}: $(gettext 'PO error'):${_s##*:}" >&2
	exit 1 ;;
## @~Japanese
## BATS テンポラリー・ファイルの書き込みにエラーが発生した場合の処理
## @~
2 )
	## @~Japanese
	## 簡潔なエラーメッセージを標準エラーに出力します。
	## @~
	echo "${_org_fname}: $(gettext 'BATS tempfile error'):${_s##*:}" >&2
	exit 1 ;;
## @~Japanese
## 翻訳されたメッセージのチェックサム（メッセージ・ダイジェスト）生成処理で使用されるテンポラリー・ファイルの書き込み中にエラーが発生した場合の処理
## @~
3 )
	## @~Japanese
	## 簡潔なエラーメッセージを標準エラーに出力します。
	## @~
	echo "${_org_fname}: $(gettext 'CHECKSUM (message digest) tempfile error'):${_s##*:}" >&2
	exit 1 ;;
esac
## @~Japanese
## 翻訳されたメッセージのチェックサム（メッセージ・ダイジェスト）を生成します。
## @~
_s=$(sha256sum "${_chksum_temp_name}" 2>&1)
if [ $? -ne 0 ] ; then
	## @~Japanese
	## 簡潔なエラーメッセージを標準エラーに出力します。
	## @~
	echo "${_org_fname}: $(gettext 'CHECKSUM (message digest) tempfile error'):${_s##*:}" >&2
	exit 1
fi

## @~Japanese
## 翻訳されたメッセージのチェックサム（メッセージ・ダイジェスト）を BATS テンポラリー・ファイルに追加書き込みします。
## @~
_s=$(echo "# $(gettext 'CHECKSUM (message digest) for all translated messages'): ${_s%% *}" 2>&1 >> "${_bats_temp_name}")
if [ $? -ne 0 ] ; then
	## @~Japanese
	## 簡潔なエラーメッセージを標準エラーに出力します。
	## @~
	echo "${_org_fname}: $(gettext 'BATS tempfile error'):${_s##*:}" >&2
	exit 1
fi

## @~Japanese
## BATS テンポラリー・ファイルのパーミッションを 755 (rwxr-xr-x) に変更します。
## @attention 仕様的に問題がある場合は、各自で適宜に変更してください。
## @~
_s=$(chmod 755 "${_bats_temp_name}" 2>&1)
if [ $? -ne 0 ] ; then
	## @~Japanese
	## 簡潔なエラーメッセージを標準エラーに出力します。
	## @~
	echo "${_org_fname}: $(gettext 'BATS tempfile error'):${_s##*:}" >&2
	exit 1
fi

## @~Japanese
## BATS テンポラリー・ファイルを BATS ファイルに移動します。
## @attention
## - mv コマンドを使用することにより、移動元のファイル属性をそのままに、かつアトミックにファイルを移動します（本プログラムの多重起動に耐える設計となっている）。
## - _bats_long_name で指定されたファイルは既存の重要ファイルかも知れません。危険防止のため、既存の _bats_long_name で指定されたファイルの上書きを禁止します。
## - _bats_long_name で指定されたファイルの SELinux セキュリティコンテキストをデフォルトタイプに設定します。
## - _bats_long_name で指定されたファイルを通常ファイルとして扱います。なお、_bats_long_name に「a/」「a//」などと指定された場合は「a」という名前のファイルが作成されます。
## @~
_s=$(mv -nTZ "${_bats_temp_name}" "${_bats_long_name}" 2>&1)
if [ $? -ne 0 ] ; then
	## @~Japanese
	## 簡潔なエラーメッセージを標準エラーに出力します。
	## @~
	echo "${_org_fname}: $(gettext 'cannot move tempfile to target BATS file'):${_s##*:}" >&2
	exit 1
fi
## @~Japanese
## 'mv -nTZ' コマンドが正常終了しても、_bats_temp_name が存在している場合はエラーとします。
## @~
if [ -a "${_bats_temp_name}" ]; then
	## @~Japanese
	## 簡潔なエラーメッセージを標準エラーに出力します。
	## @~
	if [ -a "${_bats_long_name}" ]; then
		_s=$(errno EEXIST)
		echo "${_org_fname}: $(gettext 'cannot move tempfile to target BATS file'): ${_s#* * }" >&2
	else
		echo "${_org_fname}: $(gettext 'Target BATS file not found')" >&2
	fi
	exit 1
fi
