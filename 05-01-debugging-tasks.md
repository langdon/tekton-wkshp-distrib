# Debugging Tasks

```yaml
apiVersion: tekton.dev/v1beta1
kind: Task
metadata:
  name: echo-task
spec:
  steps:
  - name: echo
    image: alpine
    command: ["echo", "hello world"]
```

This task is supposed to echo the text "hello world" to the console. However, if you run the task, you will get the following error:

```bash
Error: failed to run step echo: exit status 1
```

The reason for the error is that the echo command is expecting a single argument, but the task is passing it two arguments.

To fix the bug, we need to change the command field in the task spec to only pass one argument to the echo command. The following is the fixed task spec:

```yaml
apiVersion: tekton.dev/v1beta1
kind: Task
metadata:
  name: echo-task
spec:
  steps:
  - name: echo
    image: alpine
    command: ["echo"]
    args: ["hello world"]
```

## Common Tekton task bugs and the typical error messages

* **Incorrect command:** If the `command` field in the task spec is incorrect, the task will fail with an error message like `"failed to run step <step_name>: exit status 1"`.
* **Missing image:** If the `image` field in the task spec is missing, the task will fail with an error message like `"failed to pull image <image_name>: error pulling image"`.
* **Incorrect arguments:** If the `args` field in the task spec is incorrect, the task will fail with an error message like `"failed to run step <step_name>: invalid argument <argument_name>"`.
* **Incorrect workspaces:** If the `workspaces` field in the task spec is incorrect, the task will fail with an error message like `"failed to access workspace <workspace_name>: workspace not found"`.
* **Incorrect steps:** If the `steps` field in the task spec is incorrect, the task will fail with an error message like `"failed to run step <step_name>: step <step_name> not found"`.

## Tips for debugging Tekton task bugs

* Use the `kubectl logs` command to get the logs from the task.
* Use the `kubectl describe` command to get more information about the task.
* Use the `kubectl get pods` command to get the status of the pod that is running the task.
* Use the `tkn taskrun logs <task instance>` to see any issues. Don't forget about the `--all` flag.
