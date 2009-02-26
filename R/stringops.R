# This is a list of words that we generally do not want to capitalize.
special.words = c('a', 'an', 'and', 'as', 'at', 'but', 'by', 'en', 'for',
                  'if', 'in', 'of', 'on', 'or', 'the', 'to', 'v' , 'v.',
                  'via', 'vs',  'vs.')

# We need to know whether a character is part of the alphabet. This function
# decides that using regular expressions.
non.alphabetical.character = function(str)
{
    if (regexpr('[[:alpha:]]', str)[1] == -1)
    {
        return(TRUE)
    }
    else
    {
        return(FALSE)
    }
}
     
# If we are given a single word, we use this function to capitalize it. We
# assume that the word should be capitalized, so words should be filtered
# before reaching this function.
capitalize = function(str)
{
    # We want to skip any non-alphabetical characters at the start.
    i = 1

    while (non.alphabetical.character(substr(str, i, i)))
    {
        i = i + 1
    }
    
    sub.word = substr(str, i, nchar(str))

    # We won't change words with any non-alphabetical characters mid-word.
    if (regexpr('[^[:alpha:]][[:alpha:]]', sub.word)[1] > -1)
    {
        return(str)
    }
    # We also won't change words with uppercase characters mid-word.
    else if (sub.word != tolower(sub.word))
    {
        return(str)
    }
    # Otherwise, we simply make the first alphabetical character uppercase.
    else
    {
        str = tolower(str)
        substr(str, i, i) = toupper(substr(str, i, i))
        return(str)
    }
}

# We'll use this function to capitalize a vector of words.
smart.capitalize = function(words)
{
    output = c()

    for (word in words)
    {
        if (word %in% special.words)
        {
            output = c(output, tolower(word))
        }
        else
        {
            output = c(output, capitalize(word))
        }
    }
    
    return(output)
}

# We'll use this function to capitalize an entire sentence. In the process,
# we'll capitalize words at the front and at the end, no matter what words
# they are.
titlecase = function(str)
{
    # We want to be careful with all of the words as a first pass.
    words = smart.capitalize(strsplit(str, ' ')[[1]])

    # Then we'll blindly capitalize the words at the ends of the sentence.
    words[1] = capitalize(words[1])
    words[length(words)] = capitalize(words[length(words)])

    # Finally, we'll put our string back together again.
    output = words[1]
    for (word in words[-1])
    {
        output = paste(output, word)
    }

    return(output)
}
