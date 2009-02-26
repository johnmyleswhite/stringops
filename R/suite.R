library('RUnit')

testsuite.stringops = defineTestSuite('stringops',
                                       dir = file.path('.'),
                                       testFileRegexp = '^stringops.*\\.R',
                                       testFuncRegexp = '^test',
                                       rngKind = 'Marsaglia-Multicarry',
                                       rngNormalKind = 'Kinderman-Ramage')

testResult = runTestSuite(testsuite.stringops)

printTextProtocol(testResult)
