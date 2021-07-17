
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>


int main(void){
    int i, pid;
    char *token, command[2000], *arguments;

    while(1){
        fgets(command, sizeof(command), stdin);
        command[strlen(command)-1] = '\0';

        token = strtok(command, " ");
        if (token == NULL) { exit(-1); }

        arguments[0] = token;
        for (i=1; i<10; i++) {
            token = strtok(NULL, " ");
            if (token == NULL)
                break;
            arguments[i] = token;
        }
        arguments[i] = NULL;

        if( arguments[0] == "exit")
            exit(0);

        pid = fork();
        if (pid != 0) {
            wait(NULL);
        }else{
            execvp(arguments[0], arguments);
            fprintf(stderr, "Error: %s not found", parsed[0]);
            exit(-1);
        }
    }
}