#!/usr/bin/env python3
# Copieid with modifications from
# https://github.com/ipython/ipython/wiki/Cookbook:-Dated-logging
from time import strftime
import os.path

ip = get_ipython()

ldir = ip.profile_dir.log_dir 
fname = 'log-' + ip.profile + '-' + strftime('%Y-%m-%d') + ".py"
filename = os.path.join(ldir, fname)
notnew = os.path.exists(filename)

try:
  ip.run_line_magic('logstart', '-t -o -q %s append' % filename)
  if notnew:
      ip.logger.log_write(u"# =================================\n")
  else:
      ip.logger.log_write(u"#!/usr/bin/env python\n" )
  print (" Logging to "+filename)
except RuntimeError:
    print (" Already logging to "+ip.logger.logfname)
