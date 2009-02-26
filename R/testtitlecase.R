source('stringops.R')

library('RUnit')

test.non.alphabetical.character = function()
{
    checkEquals(non.alphabetical.character(';'), TRUE)
    checkEquals(non.alphabetical.character('5'), TRUE)
    checkEquals(non.alphabetical.character('a'), FALSE)
    checkEquals(non.alphabetical.character('l'), FALSE)
    checkEquals(non.alphabetical.character('z'), FALSE)
    checkEquals(non.alphabetical.character('A'), FALSE)
    checkEquals(non.alphabetical.character('L'), FALSE)
    checkEquals(non.alphabetical.character('Z'), FALSE)
}

test.capitalize = function()
{
    checkEquals(capitalize('this'), 'This')
    checkEquals(capitalize('iPhone'), 'iPhone')
    checkEquals(capitalize('test'), 'Test')
    checkEquals(capitalize('MySQL'), 'MySQL')    
}

test.smart.capitalize = function()
{
    str = 'this is a sentence.'

    words = strsplit(str, ' ')

    capitalized.words = smart.capitalize(words)

    for (i in 1:length(words))
    {
        checkEquals(capitalize(words[i]), capitalized.words[i])
    }
}

test.titlecase = function()
{
    checkEquals(titlecase('DO NOT CHANGE ME!'), 'DO NOT CHANGE ME!')
    checkEquals(titlecase('But, please do capitalize me!'), 'But, Please Do Capitalize Me!')
    checkEquals(titlecase('he was a man and that was all i knew'), 'He Was a Man and That Was All I Knew')
}
