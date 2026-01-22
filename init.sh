#!/bin/bash

# 1. 프로젝트 이름 입력 확인
if [ -z "$1" ]; then
  echo "❌ Error: 프로젝트 이름을 입력해주세요."
  echo "사용법: ./setup.sh <project-name>"
  exit 1
fi

PROJECT_NAME=$1

echo "🚀 Next.js 프로젝트 생성 시작: $PROJECT_NAME"

# 2. Next.js 앱 생성 (비대화형 자동 설정)
npx create-next-app@latest "$PROJECT_NAME" \
  --typescript \
  --tailwind \
  --eslint \
  --src-dir \
  --app \
  --import-alias "@/*" \
  --use-npm

if [ $? -ne 0 ]; then
  echo "❌ Next.js 프로젝트 생성 실패"
  exit 1
fi

# 3. 프로젝트 폴더로 이동
cd "$PROJECT_NAME" || exit

echo "📦 Vitest 및 테스트 환경 설치 중..."

# 4. Vitest 및 관련 라이브러리 설치
npm install -D vitest @vitejs/plugin-react jsdom @testing-library/react @testing-library/dom

echo "📂 문서 구조 생성 중..."

# 5. 문서 폴더 생성
mkdir docs
touch docs/TRD.md docs/PLAN.md

echo "📥 시스템 프롬프트(InitPrompt.md) 다운로드 중..."

# 6. InitPrompt.md 다운로드 (Public URL 적용)
PROMPT_URL="https://raw.githubusercontent.com/DevMK2/claude-party/refs/heads/main/InitPrompt.md"

curl -L -o InitPrompt.md "$PROMPT_URL"

if [ $? -eq 0 ]; then
  echo "✅ InitPrompt.md 저장 완료"
else
  echo "⚠️  다운로드 실패! (네트워크 상태를 확인해주세요)"
  touch InitPrompt.md
fi

echo ""
echo "🎉 모든 설정이 완료되었습니다!"
echo "-------------------------------------"
echo "cd $PROJECT_NAME"
echo "code .  # VS Code 실행"
echo "-------------------------------------"
echo "👉 프로젝트 루트의 InitPrompt.md 파일을 Claude Code 세션에 입력하세요."
