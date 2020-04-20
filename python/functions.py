def make_multiple_choice(question, choices, which=1, randomize=True, aota=False, 
    nota=False, none_prob=0.2, number=None):
    """
    Create a multiple choice question randomizing order
        number : question number on test (for formatting)
        question : string
        choices : list of string 
        which : which choice is correct (defaults to first in list)
            if -1 then "None of the above" is correct and a correct answer 
                wasn't provided
            if 0 then "All of the above" is correct 
        randomize : randomize order of options, making questions unique
        aota : include "All of the above" as an option
        nota : include "None of the above" as an option 
        none_prob : probability that "None of the above" is right (If a correct 
            answer is supplied, it will be removed with this probability.) 


    Note: 
       - "All of the above" always appears before "None of the above" in 
         options and after random shuffle
       - If a correct answer is removed and the answer made "None of the above",
         and there are only 3 remaining options, then "All of the above" will 
         also be added 
    
    """
    import random
    import string

    AOTA = "All of the above"
    NOTA = "None of the above"
    
    # Select right answer if given
    if which > 0:
        correct = choices[which-1]
    elif which == 0:
        correct = AOTA
    else: # which == -1:
        correct = NOTA
        
    # Randomize order of options before appending 'All ...' or 'None ...'
    if randomize:
        random.shuffle(choices)

    # Append 'All of the above'
    if aota or which == 0 :
        choices.append(AOTA)

    # Append 'None of the above'
    if nota or which == -1:
        choices.append(NOTA)

    # Remove the correct answer with probability none_prob
    if which > 0 and nota and none_prob > 0:
        if random.random() <= none_prob:
            choices.remove(correct)
            correct = NOTA
            # if not enough options after removing the correct answer, add ALL
            if (not aota) and len(choices) <= 4:
                choices.insert(len(choices)-1, AOTA)
    
    # get correct answer
    answer = string.ascii_lowercase[choices.index(correct)]


    # format if number present
    if number is None:
        blank = "\n"
    else:
        # format the question
        if(number > 9):
            blank = "\n    "
        else:
            blank = "\n   "
        
        question = str(number) + ". " + question

    # Format the question with options                
    for i, choice in enumerate(choices):
        question += blank + string.ascii_lowercase[i] + ") " + choice

    return question, answer

def make_true_false(question, answer, number=None):
    """
    Format a True/False question
    """

    # format if number present
    if number is None:
        blank = "\n"
    else:
        # format the question
        if(number > 9):
            blank = "\n    "
        else:
            blank = "\n   "
        
        question = str(number) + ". " + question
        
    question = str(number) + ". " + question
    question += blank + "a) True"
    question += blank + "b) False"

    if answer.lower() in ['t', 'true']:
        answer = "a"
    else:
        answer = "b"

    return question, answer
