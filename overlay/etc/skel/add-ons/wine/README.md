# Installing Windows Applications

The following instructions only need to be run once. They should be run
in this directory as your normal user (do not use 'sudo').

1. Install the WINE dependencies.

    ./01-install-wine-deps.sh

2. Install VARA HF. Accept the default settings and do not launch the program.

    ./02-install-vara-hf.sh

3. Install VARA FM. Accept the default settings and do not launch the program.

    ./03-install-vara-fm.sh

4. Install VARA Terminal. Install VARA FM. Accept the default settings and do not launch the program.

    ./04-install-vara-terminal.sh

5. Run the registery editor. Follow the instructions in the terminal.

    ./05-run-regedit.sh

6. If you want to include your WINE installation in a future EmComm Tools
   Community image build, run the following to make a backup of your WINE
   installation now.

    ./06-backup-wine-install.sh
