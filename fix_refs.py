import os
import re

def process_dir(d):
    for root, dirs, files in os.walk(d):
        for f in files:
            if f.endswith(".dart") and not f.endswith(".g.dart"):
                path = os.path.join(root, f)
                with open(path, "r", encoding="utf-8") as file:
                    content = file.read()
                
                # Replace SomeNameRef ref with Ref ref
                # Regex: r'\b[A-Za-z0-9_]+Ref\s+ref\b' -> 'Ref ref'
                new_content = re.sub(r'\b[A-Za-z0-9_]+Ref\s+ref\b', 'Ref ref', content)
                
                if new_content != content:
                    with open(path, "w", encoding="utf-8") as file:
                        file.write(new_content)
                    print(f"Updated {path}")

process_dir("c:/Users/resoa/Videos/Ai-Saas/aiops_command/lib")
