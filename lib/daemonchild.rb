
# == Credits
#
# Inspired by and based on Daemonize as distributed as part of
# Thomas Uehlinger's Daemons gem.
#
# Daemonize was written by Travis Whitton and is based on Perl's
# Proc::Daemonize, which was written by Earl Hood.  
#
# Also, Based on the Unix Programmer FAQ which is currently available
# http://www.faqs.org/faqs/unix-faq/programmer/faq/
# (and other places I'm sure)

class DaemonChild
  VERSION = '0.0.1'

  def self.spawn()
    # Exit fast if in app that presents itself as irb
    # as a rudimentary safety check.  if irb daemonizes and gets
    # /dev/null as STDIN, it chews up all the cpu trying to take input
    # but you really shouldn't daemonize irb anyway
    exit if $0 == 'irb'
    
    cwd = Dir.getwd

    # Fork so the parent can exit
    Process.fork and Process.exit

    # Become a process group and session group leader
    sid = Process.setsid

    # Fork so the session group leader can exit and we can not regain
    # a controlling terminal
    Process.fork and Process.exit

    # Return to original working directory
    Dir.chdir cwd
    
    # Give ourselves complete control over permissions of files we'd write
    File.umask 0

    # Close any open filehandles
    ObjectSpace.each_object(IO) do |io|
      begin
        io.close unless io.closed?
      rescue ::Exception
      end
    end

    # Reopen stdin, stdout, stdin to /dev/null
    [STDIN,STDOUT,STDERR].each do |io|
      begin
        io.reopen '/dev/null'
      rescue ::Exception
      end
    end

    return Process.pid
  end

  def self.process_name
    $0
  end
  
  def self.process_name=(name)
    $0 = name
  end

  def self.stdin=(fp)
    STDIN.reopen fp
  end

  def self.stdout=(fp)
    STDOUT.reopen fp
  end

  def self.stderr=(fp)
    STDERR.reopen fp
  end
end
