
syn keyword pythonSpecial self
syn match pythonMethod              /\w\+\((\)\@=/
syn match pythonOperator "\(+\|-\|\^\|\*\|!\|%\|<\|>\|/\|=\)"
hi def link pythonMethod Method
hi def link pythonOperator Operator
