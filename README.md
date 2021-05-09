PG STATEMENT LOG
================

*UNSTABLE* notice, mainly for my personal use.

Vim syntax highlight for postgresql "statement" log.


## Example vimrc

    function! s:psql_log_init()
      call pg#statement_log#syntax()
      syntax sync fromstart
    endfunction

    autocmd BufRead /var/log/postgresql/*.log call <SID>psql_log_init()

## Example postgresql.conf

    log_statement = 'all'
    logging_collector = on
    log_directory = '/var/log/postgresql/log'
    log_filename = 'pg-%Y-%m-%d.log'
    log_line_prefix = '%m [%p] %q%u@%d %x|%v '
