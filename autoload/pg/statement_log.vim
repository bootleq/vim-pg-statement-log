function! pg#statement_log#syntax() "{{{
  syntax match  PGSQLLog_HeadTrivial %\v\.\d{3} CST \[\d+\] \S+ \S+ % contained containedin=PGSQLLog_Head conceal
  syntax match  PGSQLLog_HeadTrivialYear %\v^\d{4}-% contained containedin=PGSQLLog_Head conceal
  syntax region PGSQLLog_Head start=_\v^\d{4}_ end=_\u: _ contains=PGSQLLog_HeadTrivial.*

  syntax match PGSQLLog_Tx  %\v(TB: BEGIN|TC: COMMIT)%
  syntax match PGSQLLog_Insert  %\v(INSERT INTO)%
  syntax keyword PGSQLLog_TxRollback  ROLLBACK
  syntax keyword PGSQLLog_TxSavepoint SAVEPOINT
  syntax match PGSQLLog_Param  %$\d\+%

  highlight link PGSQLLog_Head Comment
  highlight link PGSQLLog_Tx Keyword
  highlight link PGSQLLog_Insert Debug
  highlight link PGSQLLog_TxRollback Error
  highlight link PGSQLLog_TxSavepoint Function
  highlight link PGSQLLog_Param String
endfunction "}}}
