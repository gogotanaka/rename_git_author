new_name="gogotanaka"
new_email="qlli.illb@gmail.com"

for name in "ex1" "ex2" ..

do
        rm -rf .git/refs/original/

        git filter-branch --commit-filter '
                if [ "$GIT_COMMITTER_NAME" = #{name} ];
                then
                        GIT_COMMITTER_NAME=${new_name};
                        GIT_AUTHOR_NAME=${new_name};
                        GIT_COMMITTER_EMAIL=${new_email};
                        GIT_AUTHOR_EMAIL=${new_email};
                        git commit-tree "$@";
                else
                        git commit-tree "$@";
                fi'
done