CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission
# set -e
files='find student-submission'
for file in $files
do
    if [[ -f ListExamples.java ]]
        then
            echo "student-submission found"

        else
            echo "need file student-ssubmission.java"

    fi
done

cp ListExamples.java ..
cd ..
javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java
java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > tests_output.txt
grep "Tests run:" tests_output.txt > grep_results.txt
cat grep_results.txt
# foo = `cat grep_results.txt`
# echo $foo
# for(( i=0; i<${#foo}-1; i++ )); do
#     echo "${foo:$i:($i+1)}"
# done
for value in `cat grep_results.txt`
do
    if [[ ${value:1:2}=="," ]]
    then
        TOTAL=${value:0:1}
    # elif [[ ${value:0:1} == ${value} ]]
    # then 
    #     WRONG=${value}
    fi
    # echo $value
    WRONG=${value}
done
echo $TOTAL
echo $WRONG
# RIGHT=(($TOTAL - $WRONG))
echo $WRONG/$TOTAL