# Gerrit Ninja Tricks

Thanks to Jorg Mayer, I've learned this trick, for shell lovers\!

Not only is gerrit the hosting platform for changes, but it's also the executable itself. To run it you should be logged in the gerrit machine (and you obviously can't), but if you have configured ssh access you can create an alias like this:

    alias gerrit='ssh <yourusername>@code.wireshark.org -p 29418 gerrit'

By running **gerrit** you launch the gerrit executable on the wireshark's gerrit machine.

    Available commands of gerrit are:
    
       apropos              Search in Gerrit documentation
       ban-commit           Ban a commit from a project's repository
       close-connection     Close the specified SSH connection
       create-account       Create a new batch/role account
       create-branch        Create a new branch
       create-group         Create a new account group
       create-project       Create a new project and associated Git repository
       flush-caches         Flush some/all server caches from memory
       gc                   Run Git garbage collection
       gsql                 Administrative interface to active database
       index                
       logging              
       ls-groups            List groups visible to the caller
       ls-members           List the members of a given group
       ls-projects          List projects visible to the caller
       ls-user-refs         List refs visible to a specific user
       plugin               
       query                Query the change database
       receive-pack         Standard Git server side command for client side git push
       rename-group         Rename an account group
       review               Apply reviews to one or more patch sets
       set-account          Change an account's settings
       set-head             Change HEAD reference for a project
       set-members          Modify members of specific group or number of groups
       set-project          Change a project's settings
       set-project-parent   Change the project permissions are inherited from
       set-reviewers        Add or remove reviewers on a change
       show-caches          Display current cache statistics
       show-connections     Display active client SSH connections
       show-queue           Display the background work queues
       stream-events        Monitor events occurring in real time
       test-submit          
       version              Display gerrit version
    
    See 'gerrit COMMAND --help' for more information.

The command **gerrit review** sounds interesting. Basically it does what we're used to do in the Web UI.

Example:

    gerrit review CHANGE,PATCHSET --code-review +1

gives our vote to the change, and

    gerrit review CHANGE,PATCHSET --label Petri-Dish=+1

triggers the PD buildbot. **BE CAREFUL**: the PATCHSET is always required.

---

Imported from https://wiki.wireshark.org/dario/gerrit on 2020-08-11 23:12:27 UTC
