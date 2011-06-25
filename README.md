*prunr* is a simple tool that prunes, deletes, trashes, removes and purges
files and folders based on an associated date.

It is most useful for maintaining archives of some sort, e.g. backup files or
archived copies of documents, and pruning unneeded files from those archives.

It works as follows:

1.	it gets a list of objects, e.g. files or folders
2.	it determines a date for each, e.g. by naming convention or modification date
3.	it follows a set of rules specified in a Ruby DSL to determine which files are
	no longer needed
4.	it prunes the unnecessary files

Here is an example of a typical prunr script:

	prune '/tmp/backups/*' do
		by :mtime

		keep :all, :for => 1.week
		keep :newest => 2, :of_every => 1.week,  :for => 1.month
		keep :newest => 1, :of_every => 1.week,  :for => 1.month
		keep :newest => 1, :of_every => 1.month, :for => 6.months
		keep :newest => 1, :of_every => 1.year,  :for => 6.years
	end

This file will look at all files and folders in `/tmp/backups` and perform a pruning
based on their last modification date.

*	it will keep all files for one week
*	then it will keep the oldest 2 of each week for a month
*	then it will keep the oldest of each week for a month
*	then it will keep the oldest of each month for 6 months
*	finally it will keep the oldest of each year for 6 years
*	all other files will be pruned

