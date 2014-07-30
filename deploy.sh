#!/bin/bash
# deploy dotfiles, helper scripts and additional configuration

# folders to be synced
SYNC_FOLDERS="dotfiles scripts"

# perform diff and present user with choices regarding sync if files differ
sync_file_interactive () {
  repofile=$1; syncfolder=$2


  if test "${syncfolder}" = "dotfiles"; then
    localfile="${HOME}/${repofile#*/}"
  elif test "${syncfolder}" = "scripts"; then
    localfile="/usr/bin/${repofile#*/}"
  else
    return 1
  fi


  if test -f ${repofile}; then

    # if source and target config differ, perform vimdiff
    if diff "${repofile}" "${localfile}"; then
      :
    else
      if test "${repofile}" -nt "${localfile}"; then
        choice="none"

        until echo "d i s" | grep ${choice}; do
          echo "Versions for ${repofile#*/} differ and the repository version is newer than the local version. (i)gnore / (d)iff / in(s)tall repository version locally"
          read -n 1 choice
        done

        case ${choice} in
          d)
            vimdiff "${repofile}" "${localfile}"
            ;;
          s)
            cp -v "${repofile}" "${localfile}"
            ;;
          i)
            return
            ;;
        esac


      else
        choice="none"

        until echo "d i c" | grep ${choice}; do
          echo "Versions for ${repofile#*/} differ and the repository version is older than the local version. (i)gnore / (d)iff / (c)opy local version to repository"
          read -n 1 choice
        done

        case ${choice} in
          d)
            vimdiff "${repofile}" "${localfile}"
            ;;
          c)
            cp -v "${localfile}" "${repofile}"
            git add "${repofile}"
            ;;
          i)
            return
            ;;
        esac
      fi
    fi
  fi
}

# perform interactive sync for all $SYNC_FOLDERS
sync_repo_interactive () {
  for folder in ${SYNC_FOLDERS}; do
    for file in $(find ${folder} -type f); do
      sync_file_interactive "${file}" "${folder}"
      echo $?
    done
  done
}

sync_repo_interactive
