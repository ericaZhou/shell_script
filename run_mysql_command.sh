#!/bin/bash
#Programming：在最近的一个时间点S处执行mysql的指令，时间点S是的分钟数是能整除5，并在执行了查询后打印出执行完的时间
#						主要目的在于学习while循环和if判断语句
#Time：编写时间：2013年3月28日12:53:42
#Version：1.0
#Author：Erica Zhou
sec=`date +%S`
min=`date +%M`
flag=1
while [ $flag == 1 ]
do
	#注意“[”和“]”前后的空格，除了“]”之后的空格，其它的空格全都不可以省略，否则会报错
	if [ $(($min%5)) == 4  ] ; then
		#while和do之间在两行之间回车符
		while [ "$sec" != 00 ] 
		do
			sleep 1
			sec=`date +%S`
		done
		mysql -uroot -p123 -e"show global status like '%Key_read_requests%';show global status like '%Key_reads%';show global status like '%Key_write_requests%';show global status like '%Key_writes%';show variables like '%key_buffer_size%'; show global status like '%Key_blocks_unused%';  show variables like '%key_cache_block_size%';show global status like '%Key_blocks_not_flushed%'; show global status like '%Innodb_pages_created%';show global status like '%Innodb_pages_read%';show global status like '%Innodb_pages_written%';show variables like '%innodb_log_buffer_size%'; show global status like '%Innodb_row_lock_time%'; show global status like '%Innodb_row_lock_waits%'; show global status like '%Innodb_rows_read%'; show global status like '%Innodb_rows_deleted%'; show global status like '%Innodb_rows_updated%'; show global status like '%Innodb_rows_inserted%';show global status like '%Questions%'; show global status like '%Com_select%'; show global status like '%Com_delete%'; show global status like '%Com_insert%'; show global status like '%Com_update%'; show global status like '%Com_replace%'; show global status like '%Com_load%'; show global status like '%Com_delete_multi%'; show global status like '%Com_insert_select%'; show global status like '%Com_update_multi%'; show global status like '%Com_replace_select%';show variables like '%max_connections%';show global status like '%Max_used_connections%';show global status like '%Aborted_clients%';show global status like '%Aborted_connects%';show global status like '%Threads_connected%';show  global status like '%Connections%';show global status like '%Handler_write%';show global status like '%Handler_update%';show global status like '%Handler_delete%';show global status like '%Handler_read_first%';show global status like '%Handler_read_key%';show global status like '%Handler_read_next%';show global status like '%Handler_read_prev%';show global status like '%Handler_read_rnd%';show global status like '%Handler_read_rnd_next%';show global status like '%Bytes_sent%';show global status like '%Bytes_received%';show global status like '%Qcache_queries_in_cache%';show global status like '%Qcache_hits%';show global status like '%Qcache_inserts%';show global status like '%Qcache_not_cached%';show global status like '%Qcache_lowmem_prunes%';show variables like '%query_cache_size%';show global status like '%Qcache_free_memory%';show global status like '%Qcache_total_blocks%';show global status like '%Qcache_free_blocks%';show global status like '%Select_full_join%';show global status like '%Select_full_range_join%';show global status like '%Select_range%';show global status like '%Select_range_check%';show global status like '%Select_scan%';show global status like '%Sort_rows%';show global status like '%Sort_range%';show global status like '%Sort_merge_passes%';show global status like '%Sort_scan%';show global status like '%Table_locks_immediate%';show global status like '%Table_locks_waited%';show global status like '%Slow_queries%';show global status like '%Created_tmp_tables%';show global status like '%Created_tmp_disk_tables%';show global status like '%Created_tmp_files%';show global status like '%Handler_commit%';show global status like '%Handler_rollback%';show global status like '%Handler_savepoint%';show global status like '%Handler_savepoint_rollback%';show  innodb status\G" -N -s;		
		flag=0
	else
		sleep 60
		min=`date +%M`
	fi
	date
done
