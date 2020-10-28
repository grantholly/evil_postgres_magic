
/*
Requires plpython3u
*/
create database danger;

\c danger;

create language plpython3u;

-- async listen for topology changes
listen topo;

-- do dangerous shit to your database with Python
create or replace function pyCtl()
       returns void
       as $py$
          import subprocess
          cmd = "/usr/lib/postgresql/11/pg_ctl promote -D /var/lib/postgresql/data"
          subprocess.run(cmd, shell=True)
       $py$
language 'plpython3u';

-- do dangerous shit to your database with SQL and notify about it
create or replace function promote()
       returns void
       as $sql$
          begin
          perform pyCtl();
          notify topo, 'promtion event';
          end;
       $sql$
language 'plpgsql';

-- oh god
select promote();

-- WTF?
unlisten topo;
