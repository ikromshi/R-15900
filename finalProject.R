########################################################################
############## PROBLEM 1 DESCRIPTION:
# Given an array of integers "nums" and an integer "target", return indices of the two numbers such that they add up to "target".
# You may assume that each input would have exactly one solution, and you may not use the same element twice.
# You can return the answer in any order.

############## Example 1
# Input: nums = [2,7,11,15], target = 9
# Output: [0,1]
# Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

############## Example 2
# Input: nums = [3,2,4], target = 6
# Output: [1,2]

############## SOLUTION:

twosum<- function(nums, target) {
  n<-length(nums)
  for(i in 1:(n-1)) {
    for(j in (i+1):n) {
      if(nums[i]+nums[j]==target) { return(c(i-1,j-1))}
    }
  }
}
twosum(c(2,7,11,15), 13)
twosum(c(3,2,4), 6) 




########################################################################
############## PROBLEM 2 DESCRIPTION:
# Given two integers n and k, return all possible combinations of k numbers chosen from the range [1, n].
# You may return the answer in any order.

############## Example 1
# Input: n = 4, k = 2
# Output: [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
# Explanation: There are 4 choose 2 = 6 total combinations.
# Note that combinations are unordered, i.e., [1,2] and [2,1] are considered to be the same combination.

############## Example 2
# Input: n = 1, k = 1
# Output: [[1]]
# Explanation: There is 1 choose 1 = 1 total combination.

############## SOLUTION:

combine<- function(n, k) {
  sub<- function(nums,k) {
    if(k==1) { return(matrix(nums, ncol=1))  }
    else {
      if(k==length(nums)) {return(matrix(nums, nrow = 1))}
      else {
        ans<- rbind(cbind(nums[1], Recall(nums[-1],k-1)),
                    Recall(nums[-1], k))
        return(ans)
        }
    }
  }
  result<- sub(1:n, k)
  return(result)
}
combine(4,2)
combine(6,1)
combine(6,6)
combine(1,1)
