#!//bin/bash

. library.sh

echo "First off, do you have echo in your PATH? (1=yes, 2=no)"
read answer
while validint $answer 1 2 ; do
  echo "Try again. Do you have echo "
  echo "in your PATH? (1=yes, 2=no)"
  read answer
done

if checkForCmdInPath "echo" ; then
  echo "Yes, you have echo in your PATH. "
else
  echo "Nope, you don't have echo in your PATH. "
fi

echo ""
echo "Enter a year that you think might be a leap year: "
read year

while validint $year 1 9999 ; do
  echo "Invalid year. Please check your input: "
  read year
done

if isLeapYear $year ; then
  echo "Yes, $year is a leap year. "
else
  echo "No, $year is not a leap year. "
fi

exit 0