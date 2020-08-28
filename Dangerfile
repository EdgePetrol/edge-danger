danger.import_plugin('https://raw.githubusercontent.com/EdgePetrol/danger-rcov/master/lib/rcov/plugin.rb')

fail('Please provide a summary in the PR description') if (github.pr_body || '').length < 5

warn(':exclamation: Big PR') if git.lines_of_code > 500

warn('Please rebase to get rid of the merge commits in this PR') if git.commits.any? { |c| c.message =~ /^Merge branch 'master'/ }

warn('PR base is not set to master!') if !github.branch_for_base.include?('master')

# PR title consistency
warn("Title of PR should start with [EDG-$JIRA_ISSUE_NUMBER]") if !github.pr_title.match(/\[EDG-\d*\]\s/)

# Don't let testing shortcuts get into master by accident
if Dir.exist?('spec')
  warn('fdescribe left in tests') if `grep -r -e '\\bfdescribe\\b' spec/ |grep -v 'danger ok' `.length > 1
  warn('fcontext left in tests') if `grep -r -e '\\bfcontext\\b' spec/ |grep -v 'danger ok' `.length > 1
  warn('fit left in tests') if `grep -r -e '\\bfit\\b' spec/ | grep -v 'danger ok' `.length > 1
  warn('ap left in tests') if `grep -r -e '\\bap\\b' spec/ | grep -v 'danger ok' `.length > 1
  warn('puts left in tests') if `grep -r -e '\\bputs\\b' spec/ | grep -v 'danger ok' `.length > 1
end

if ENV['CIRCLE_TOKEN']
  markdown rcov.report("staging", "build")
end
