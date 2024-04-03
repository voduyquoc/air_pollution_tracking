## VM SSH Setup

- The first few minutes of [this video by Alexey](https://www.youtube.com/watch?v=ae-CV2KfoN0&list=PL3MmuxUbc_hJed7dXYoJw8DoCuVHhGEQb) is recommended for understanding how it's done. You can then follow the below steps.

- Create an ssh key in your local system in the `.ssh` folder - [Guide](https://cloud.google.com/compute/docs/connect/create-ssh-keys#linux-and-macos)

- Add the public key (`.pub`) to your VM instance - [Guide](https://cloud.google.com/compute/docs/connect/add-ssh-keys#expandable-2)

- Create a config file in your `.ssh` folder

  ```bash
  code ~/.ssh/config
  ```

- Copy the following snippet and replace with External IP of the Virtual Machine. Username and path to the ssh private key

    ```bash
    Host germany-air-quality-instance
        HostName <External IP Address>
        User <username>
        IdentityFile <path/to/home/.ssh/gcp>
    ```

- Once you are setup, you can simply SSH into the servers using the below commands in separate terminals. Do not forget to change the IP address of VM restarts.

    ```bash
    ssh germany-air-quality-instance
    ```

- You will have to forward ports from your VM to your local machine for you to be able to see Mage UI. Check how to do that [here](https://youtu.be/ae-CV2KfoN0?t=1074)



#### [Installation Reference - Ankur Chavda](https://github.com/ankurchavda/streamify/blob/main/setup/ssh.md)