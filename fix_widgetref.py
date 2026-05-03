import os
import re

def process_dir(d):
    for root, dirs, files in os.walk(d):
        for f in files:
            if f.endswith(".dart") and not f.endswith(".g.dart"):
                path = os.path.join(root, f)
                with open(path, "r", encoding="utf-8") as file:
                    content = file.read()
                
                # Replace "Widget build(BuildContext context, Ref ref)" with "Widget build(BuildContext context, WidgetRef ref)"
                new_content = content.replace("Widget build(BuildContext context, Ref ref)", "Widget build(BuildContext context, WidgetRef ref)")
                
                if new_content != content:
                    with open(path, "w", encoding="utf-8") as file:
                        file.write(new_content)
                    print(f"Fixed {path}")

process_dir("c:/Users/resoa/Videos/Ai-Saas/aiops_command/lib")
