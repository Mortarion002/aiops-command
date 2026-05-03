import os

replacements = {
    "onboardingNotifierProvider": "onboardingProvider",
    "authNotifierProvider": "authProvider",
    "authErrorNotifierProvider": "authErrorProvider",
    "dateRangeNotifierProvider": "dateRangeProvider",
    "logFilterNotifierProvider": "logFilterProvider",
}

def process_dir(d):
    for root, dirs, files in os.walk(d):
        for f in files:
            if f.endswith(".dart") and not f.endswith(".g.dart"):
                path = os.path.join(root, f)
                with open(path, "r", encoding="utf-8") as file:
                    content = file.read()
                
                new_content = content
                for k, v in replacements.items():
                    new_content = new_content.replace(k, v)
                
                if new_content != content:
                    with open(path, "w", encoding="utf-8") as file:
                        file.write(new_content)
                    print(f"Updated {path}")

process_dir("c:/Users/resoa/Videos/Ai-Saas/aiops_command/lib")
