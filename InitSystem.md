1. Next.js 프로젝트 생성
``` Bash
npx create-next-app@latest my-ad-app --typescript --tailwind --eslint
```
# 질문 답변:
# Use `src/` directory? -> Yes (추천)
# Use App Router? -> Yes
# Customize default import alias? -> No (@/* 사용)

2. Vitest 및 테스트 환경 설치 (TDD용)
```Bash
cd my-ad-app
npm install -D vitest @vitejs/plugin-react jsdom @testing-library/react @testing-library/dom
```

3. 문서 구조 생성
``` Bash
mkdir docs
touch docs/TRD.md docs/PLAN.md
```
