danger.import_plugin('https://raw.githubusercontent.com/EdgePetrol/danger-rcov/debug/lib/rcov/plugin.rb')

fail('Please provide a summary in the PR description') if (github.pr_body || '').length < 5

warn(':exclamation: Big PR') if git.lines_of_code > 500

warn('Please rebase to get rid of the merge commits in this PR') if git.commits.any? { |c| c.message =~ /^Merge branch 'staging'/ }

warn('PR base is not set to staging!') if !github.branch_for_base.include?('staging')

# PR title consistency
warn("Title of PR should start with [EDG-$JIRA_ISSUE_NUMBER]") if !github.pr_title.match(/\[EDG-\d*\]\s/)

if ENV['CIRCLE_TOKEN']
  markdown rcov.report('staging', 'build')
end
